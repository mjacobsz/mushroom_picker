# README

## What is this?
Webapp that shows a list of mushrooms. The list can be narrowed down by selecting mushroom attributes via the web selectors. A mushroom will be displayed in its abbreviated form, since there are 23 properties for each mushroom each, and a row would not fit in regular browser.

The mushroom data set is obtained from this location: https://archive.ics.uci.edu/ml/datasets/Mushroom.
One can find the descriptions of the various attributes there as well.

A live version of this app can be found here: https://mushroom-picker.herokuapp.com/

(note that it may require some time to render the first page, since the app may be ['sleeping'](https://devcenter.heroku.com/articles/free-dyno-hours#dyno-sleeping)

## Setup

### Prequisites
- ruby 2.6.3
- rails 5.2.3
- sqlite

### Database creation and initialization
Create the database by running

```bash
bin/rails db:migrate
```

The mushroom records are being generated from the "agaricus-lepiota.data" file via the following rake command:

```bash
bin/rake data_setup:create_mushrooms
```

Or if, you don't feel like doing the previous two steps, just copy the prefilled database `development.sqlite3` from the `config/` folder to the `db/` folder

### Running
Hit up the server

```bash
bin/rails s
```

and you're good to go. By default, the app lives at `http://localhost:3000`