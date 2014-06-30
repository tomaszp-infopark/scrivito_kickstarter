# Scrivito Kickstarter

[![Gem Version](https://badge.fury.io/rb/scrivito_kickstarter.png)](http://badge.fury.io/rb/scrivito_kickstarter)
[![Coverage Status](http://img.shields.io/coveralls/infopark/scrivito_kickstarter/master.svg)](https://coveralls.io/r/infopark/scrivito_kickstarter)
[![Code Climate](https://codeclimate.com/github/infopark/scrivito_kickstarter.png)](https://codeclimate.com/github/infopark/scrivito_kickstarter)
[![Dependency Status](https://gemnasium.com/infopark/scrivito_kickstarter.png)](https://gemnasium.com/infopark/scrivito_kickstarter)
[![Build Status](https://travis-ci.org/infopark/scrivito_kickstarter.png)](https://travis-ci.org/infopark/scrivito_kickstarter)

Scrivito Kickstarter provides generators and rake tasks to quickly setup or enhance an
[Scrivito](http://scrivito.com) Ruby on Rails project. All generated code
represents a working example, but can be fully customized within the application.


## Installation and Usage

Please visit our Documentation to get the
[latest installation and usage information](https://scrivito.com/preparation). An [overview and
and more detailed information](https://scrivito.com/kickstarter) are also available.


## Testing

To run the RSpec tests of the Kickstarter engine, simply call:

    $ rake spec


### Integration Tests

If you would like to setup an application and integrate your local gem, we recommend using
[infopark/kick-it](https://github.com/infopark/kick-it). This also allows you to test the gem in
combination with other lokal gems more easily.


### Continuous Integration with Travis

As the Kickstarter is a public repository, it is easily possible for you to run *Continuous
Integration* tests of your fork with [Travis](https://travis-ci.org) as you develop new features. In
order to run all Kickstarter Tests on the platform you should:

1. See the **Contributing** section and set up your local fork of the Kickstarter. Make
   sure that all tests are passing on your local machine.

2. Create a `.env` file in the root directory of the gem and add a Scrivito `tenant` and `api key`
   that can be used for development purposes. You can find credentials in your
   [Scrivito Dashboard](https://scrivito.com). See the contributing section below for more
   information.

        SCRIVITO_TENANT=<your development tenant name>
        SCRIVITO_API_KEY=<your development tenant api key>

3. Go into your local Kickstarter directory and run `rake travis_encrypt` to get a list of
   secure travis credentials and add them to the `.travis.yml` file. Please check these changes in
   with your next pull request.

4. Sign in at [Travis](https://travis-ci.org) with your Github Account.

5. Enable the Travis Webhook for your `scrivito_kickstarter` fork.

If you now push commits to your forked repository or send a pull request, travis will automatically
run all tests for you and indicate the build status.


## Changelog

See [Changelog](https://github.com/infopark/scrivito_kickstarter/blob/master/CHANGELOG.md) for more
details.


## Contributing

We would be very happy and thankful if you open new issues in order to further improve Scrivito
Kickstarter. If you want to go a step further and extend the functionality or fix a problem, you can
do so any time by following the steps below.

1. Signup for a [free Scrivito account](http://www.scrivito.com/) and setup a test CMS in the
   Scrivito Dashboard.

2. Fork and clone the
   [Scrivito Kickstarter GitHub repository](https://github.com/infopark/scrivito_kickstarter).

        git clone git@github.com:_username_/scrivito_kickstarter.git
        cd scrivito_kickstarter

3. We suggest using [rbenv](https://github.com/sstephenson/rbenv/) for managing your local Ruby
   version. Make sure to use at least Ruby version 2.0.

        ruby --version

4. Create the bundle and run all test to make sure everything is working before you add your own
   changes. You find some more details about testing above in the __Testing__ section.

        bundle
        rake spec

5. Create your feature branch and create a pull request for the `develop` branch. Please take a
   look at the already existing generators and rake tasks to get an impression of our coding style
   and the general architecture.

6. We are using the [GitHub Styleguides](https://github.com/styleguide) and would prefer if you
   could stick to it.


## License
Copyright (c) 2009 - 2014 Infopark AG (http://www.infopark.com)

This software can be used and modified under the LGPL-3.0. Please refer to
http://www.gnu.org/licenses/lgpl-3.0.html for the license text.
