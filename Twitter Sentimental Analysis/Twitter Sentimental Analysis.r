# Set working directory
setwd("C:/Users/milan/R-Projects/Twitter Sentimental Analysis")

# Load libraries
library(syuzhet)
library(SentimentAnalysis)
library(ggplot2)
library(wordcloud)
library(RColorBrewer)

# Read dataset
tweets <- read.csv("Tweets.csv", stringsAsFactors = FALSE, quote="")

# Extract tweet text
tweet_text <- tweets$text

# Clean tweets
clean_tx1 <- gsub("(RT|via)((?:\\b\\w*@\\w+)+)", "", tweet_text)
clean_tx2 <- gsub("http[^[:blank:]]+", "", clean_tx1)
clean_tx3 <- gsub("@\\w+", "", clean_tx2)
clean_tx4 <- gsub("[[:punct:]]", "", clean_tx3)
clean_tx5 <- gsub("[[:digit:]]", "", clean_tx4)

# Sentiment analysis
sentiment <- get_nrc_sentiment(clean_tx5)

# Calculate sentiment scores
sentimentscores <- data.frame(colSums(sentiment))
names(sentimentscores) <- "Score"

sentimentscores <- cbind("sent" = rownames(sentimentscores), sentimentscores)
rownames(sentimentscores) <- NULL

print(sentimentscores)

# --------------------------------
# 1️⃣ Sentiment Bar Plot
# --------------------------------

p1 <- ggplot(sentimentscores, aes(x=sent, y=Score, fill=sent)) +
  geom_bar(stat="identity") +
  theme_minimal() +
  theme(legend.position="none") +
  xlab("Sentiments") +
  ylab("Scores") +
  ggtitle("Twitter Sentiment Distribution")

ggsave("sentiment_bar_plot.png", plot=p1, width=8, height=6)

# --------------------------------
# 2️⃣ Positive vs Negative Pie Chart
# --------------------------------

pos_neg <- sentimentscores[sentimentscores$sent %in% c("positive","negative"),]

png("positive_negative_pie.png", width=800, height=600)

pie(pos_neg$Score,
    labels=pos_neg$sent,
    col=c("green","red"),
    main="Positive vs Negative Tweets")

dev.off()

# --------------------------------
# 3️⃣ Emotion Distribution Plot
# --------------------------------

emotion_data <- sentimentscores[1:8,]

p2 <- ggplot(emotion_data, aes(x=sent, y=Score, fill=sent)) +
  geom_bar(stat="identity") +
  theme_minimal() +
  ggtitle("Emotion Distribution in Tweets") +
  xlab("Emotion") +
  ylab("Count")

ggsave("emotion_distribution.png", plot=p2, width=8, height=6)

# --------------------------------
# 4️⃣ Word Cloud
# --------------------------------

png("wordcloud.png", width=800, height=600)

wordcloud(words=clean_tx5,
          max.words=100,
          colors=brewer.pal(8,"Dark2"),
          random.order=FALSE)

dev.off()