# Twitter Sentiment Analysis using R

This project performs **sentiment analysis on Twitter data** using R.
It cleans tweet text, extracts emotions using the **NRC sentiment lexicon**, and generates multiple visualizations.

## 📊 Features

* Tweet text preprocessing
* Sentiment analysis using **syuzhet**
* Emotion detection (anger, joy, trust, etc.)
* Multiple visualizations:

  * Sentiment bar chart
  * Positive vs Negative pie chart
  * Emotion distribution graph
  * Word cloud

## 📁 Project Structure

```
Twitter Sentimental Analysis
│
├── Tweets.csv
├── Twitter Sentimental Analysis.r
├── sentiment_bar_plot.png
├── positive_negative_pie.png
├── emotion_distribution.png
├── wordcloud.png
└── README.md
```

## ⚙️ Requirements

Open R or VS Code R terminal and run:

```r
install.packages("syuzhet")
install.packages("SentimentAnalysis")
install.packages("ggplot2")
install.packages("wordcloud")
install.packages("RColorBrewer")
```

## ▶️ Running the Project

1. Clone the repository

```
git clone https://github.com/MilanM002005/R-project.git
```

2. Navigate to the project folder

```
cd R-project
```

3. Open the R script in VS Code

```
Twitter Sentimental Analysis.r
```

4. Run the script

In VS Code press:

```
Ctrl + Enter OR PRESS PLAY BUTTON ON TOP
```

or run in R terminal:

```
source("Twitter Sentimental Analysis.r")
```

## 📈 Output

After running the script, the following plots will be generated:

* `sentiment_bar_plot.png`
* `positive_negative_pie.png`
* `emotion_distribution.png`
* `wordcloud.png`

These files will appear in the project folder.

## 🧠 Sentiment Categories

The NRC lexicon detects the following emotions:

* anger
* anticipation
* disgust
* fear
* joy
* sadness
* surprise
* trust
* positive
* negative

## 👨‍💻 Author

GROUP 8
