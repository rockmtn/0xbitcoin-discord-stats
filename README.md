# 0xBitcoin Discord stats

- [Example chart](https://docs.google.com/spreadsheets/d/e/2PACX-1vSfTvIo5dtrDZ416hOmPR_eLyKwplA8YNNDbpMdFw58K-8Obi5PB6u6UZGmQzuekvzmY4Gwcjrdymct/pubchart?oid=439616913&format=image)
- [Example spreadsheet](https://docs.google.com/spreadsheets/d/1ameHdrmsoXp37NXhfC7AXE8dI4UfVS5N4RJBBHXdwQI/edit?usp=sharing)

## Scripts

### `member_stats.rb`

Read all the guild member data from the 0xBitcoin Discord, find the join date for each user, and
compute how many new members have joined per week. It writes the output data to `members.tsv` in
tab-separated format, which you can copy-paste into Excel or Google Sheets. Here's what the data
looks like (header line added for clarity):

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

### `message_stats.rb`

Search for all messages from the 0xBitcoin Discord, find total sent per week. It writes the output
data to `messages.tsv` in tab-separated format, which you can copy-paste into Excel or Google
Sheets. Here's what the data looks like (header line added for clarity):

```
week	messages
2018-02-12	7011
2018-02-19	23844
2018-02-26	17755
2018-03-05	13165
2018-03-12	12504
2018-03-19	7291
2018-03-26	8115
2018-04-02	9347
2018-04-09	11890
2018-04-16	10640
...
```

Note: This message activity also includes Discord's join messages (e.g., "A wild Internal\_Toast has
appeared"), but the number of these is very low relative to total message count (maybe 1%).

* * *

## Usage

```
bundle exec ruby member_stats.rb
```

## Configuration

Here's an example config: [config.example.yml](config.example.yml)

Copy `config.example.yml` to `config.yml` and put your Discord token in it. Here's how to get your
Discord token:

<https://discordhelp.net/discord-token>

## Requirements

- Ruby
- Bundler gem (`gem install bundler`)

## Get dependencies

```
bundle install --path vendor/bundle
```
