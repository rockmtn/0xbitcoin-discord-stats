# 0xBitcoin Discord stats

![0xBitcoin Discord members over time](https://docs.google.com/spreadsheets/d/e/2PACX-1vSfTvIo5dtrDZ416hOmPR_eLyKwplA8YNNDbpMdFw58K-8Obi5PB6u6UZGmQzuekvzmY4Gwcjrdymct/pubchart?oid=439616913&format=image)

This script reads all the guild member data from the 0xBitcoin Discord, finds the join date for each user, and computes how many new members have joined per week. It writes the output data to `discord.tsv` in tab-separated format, which you can copy-paste into Excel or Google Sheets. Here's what the data looks like:

```
week	new members	total members
2018-02-08	5	5
2018-02-15	130	135
2018-02-22	48	183
2018-03-01	51	234
2018-03-08	47	281
2018-03-15	33	314
2018-03-22	44	358
2018-03-29	29	387
2018-04-05	40	427
2018-04-12	37	464
...
```

- [Example spreadsheet](https://docs.google.com/spreadsheets/d/1ameHdrmsoXp37NXhfC7AXE8dI4UfVS5N4RJBBHXdwQI/edit?usp=sharing)


## Requirements

- Ruby

## Installation

```
bundle install --path vendor/bundle
```

## Configuration

Copy `config.example.yml` to `config.yml` and put your Discord token in it. Here's how to get your Discord token:

<https://discordhelp.net/discord-token>
