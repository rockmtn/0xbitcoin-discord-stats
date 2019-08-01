# 0xBitcoin Discord stats
![0xBitcoin Discord members over time](https://docs.google.com/spreadsheets/d/e/2PACX-1vSfTvIo5dtrDZ416hOmPR_eLyKwplA8YNNDbpMdFw58K-8Obi5PB6u6UZGmQzuekvzmY4Gwcjrdymct/pubchart?oid=439616913&format=image)

## Scripts

### `member_stats.rb`

- [Members over time](https://docs.google.com/spreadsheets/d/1ameHdrmsoXp37NXhfC7AXE8dI4UfVS5N4RJBBHXdwQI/edit#gid=670755958) (chart)
- [Members over time](https://docs.google.com/spreadsheets/d/1ameHdrmsoXp37NXhfC7AXE8dI4UfVS5N4RJBBHXdwQI/edit?usp=sharing) (spreadsheet)

Read all the guild member data from the 0xBitcoin Discord, find the join date for each user, and
compute how many new members have joined per week. It writes the output data to `members.tsv` in
tab-separated format, which you can copy-paste into Excel or Google Sheets. Here's what the data
looks like (header line added for clarity):

```
week	new members	total members
2018-02-12	85	85
2018-02-19	68	153
2018-02-26	64	217
2018-03-05	47	264
2018-03-12	43	307
2018-03-19	30	337
2018-03-26	37	374
2018-04-02	29	403
2018-04-09	42	445
2018-04-16	35	480
...
```

### `message_stats.rb`

- [Messages over time](https://docs.google.com/spreadsheets/d/1ameHdrmsoXp37NXhfC7AXE8dI4UfVS5N4RJBBHXdwQI/edit#gid=95119642) (chart)
- [Messages over time](https://docs.google.com/spreadsheets/d/1ameHdrmsoXp37NXhfC7AXE8dI4UfVS5N4RJBBHXdwQI/edit#gid=1552476287) (spreadsheet)

Search for all messages from the 0xBitcoin Discord, find total sent per week. It writes the output
data to `messages.tsv` in tab-separated format, which you can copy-paste into Excel or Google
Sheets. Here's what the data looks like (header line added for clarity):

```
week	new messages	total messages
2018-02-12	7011	7011
2018-02-19	23844	30855
2018-02-26	17755	48610
2018-03-05	13165	61775
2018-03-12	12504	74279
2018-03-19	7291	81570
2018-03-26	8115	89685
2018-04-02	9347	99032
2018-04-09	11890	110922
2018-04-16	10640	121562
...
```

Note: This message activity also includes Discord's join messages (e.g., "A wild Infernal\_Toast has
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
