# Poutine Shop
### An example dbt project by Montreal Analytics

This repository is an example of [dbt](https://www.getdbt.com/) project best practices and is designed to be used as a reference for other dbt projects.

It contains the data transformation logic for [Montreal Analytics](https://montrealanalytics.com/?utm_source=github&utm_campaign=poutineshop)' fictional Poutine Shop business.

&nbsp;

## Contribution

This project is maintained by the [Montreal Analytics](https://montrealanalytics.com/?utm_source=github&utm_campaign=poutineshop) team with all contributions coming from the team. We add contributions occassionally to highlight new best practices. 

&nbsp;

## Installation and Usage

- Use the package manager [pip](https://pip.pypa.io/en/stable/) to install the dev requirements ([dbt](https://www.getdbt.com/), [pre-commit](https://pre-commit.com/))
- Run `pre-commit install` to set up your git hook scripts. This will set your hooks so that the next time you push, pre-commit will be invoked (note: on its first invocation, pre-commit will need to install its own dependencies which may take a minute; these dependencies will be installed outside of your project and will be available from that moment onwards).

```bash
$ pip install -r requirements.txt
$ pre-commit install
```
 

### Profile

In order to use Poutine Shop, add the following to your ~/.dbt/profiles.yml file, taking care to replace the value of the `user` and `schema` parameter.
If you don't already have a profiles file, create a new one.

```
poutine_shop:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: lo43931.us-central1.gcp
      user: martin.guindon

      # SSO config
      authenticator: externalbrowser

      database: poutineshop_dev_db
      warehouse: elt_xs_wh
      schema: dbt_mguindon
      threads: 8

```
 

### Set up an environment variable

In order to set up account as an environment variable, follow the below steps,

- Activate your virtual environment for Poutine Shop.
- Log in to Snowflake and copy the account_id (it's the prefix of the URL e.g. some.account.id.snowflake_computing.com)
- Run the following command and sub in the Snowflake account_id from the previous step: `export sf_account_id="some.account.id"`
- Validate the above step by running the command: `echo "$sf_account_id"`
- Modify the value for account field to "`{{ env_var('sf_account_id') }}"` in the profiles.yml file.
 

### Using the project:

Once everything has been setup, try running the following commands:

- dbt debug (if you're having issues)
- dbt deps
- dbt seed
- dbt run
- dbt test
 

### SQL Styleguide + dbt Best Practices

We follow the [Matt Mazur SQL style guide](https://github.com/mattm/sql-style-guide) and the one by [dbt Labs for dbt-specific behaviors](https://github.com/dbt-labs/corp/blob/main/dbt_style_guide.md).

We also follow the [best practices documented on the dbt website](https://docs.getdbt.com/docs/guides/best-practices/).

SQL and YAML styles are enforced by linters that runs automatically before any commit.
 
&nbsp;

## Working with Pre-Commit
- Pre-commit is configured to run various checks automatically when you attempt to push your code. We've overridden the default commit pattern to run on push to make committing small changes easier. When you attempt to push your code the pre-commit hooks will run, and if they pass, the push will succeed; if not there is some sort of issue that needs to be resolved before pushing your changes.
- Pre-commit will only run against changed files to keep its execution as quick as possible.
- On its first execution, pre-commit will install any dependencies it needs into a virtual environment (located outside of this repo); this may take a few minutes on its first run, but every following run will reuse that env and as a result will be much quicker.
- The following tools are installed and orchestrated with pre-commit.
 

### Working with SQLFluff
- SQLFluff lint is configured as a pre-commit hook that runs on push, so in most cases no explicit commands are needed. This will only list errors and will not fix any errors if found.
- If you would like to run SQLFluff lint manually, or would like to run it in fix mode, you can do so with the following commands which will run them through pre-commit.
```
pre-commit run --hook-stage push sqlfluff-lint --all-files
pre-commit run --hook-stage manual sqlfluff-fix --all-files
```
 

### Working with YAMLLint
- YAMLLint is configured as a pre-commit, so in most cases no explicit commands are needed. This will only list errors and will not fix any errors if found.
- If you would like to run YAMLLint manually, you can do so with the following command which will run it through pre-commit.
```
pre-commit run --hook-stage push yamllint
```
 

### Working with dbt-gloss
- dbt-gloss is configured as a set of pre-commit hooks, so in most cases no explicit commands are needed. These hooks will ensure the dbt project is following standard convention. This will only list errors and will not fix any errors if found.
- If you would like to run dbt-gloss manually, you can do so with the following command which will run it through pre-commit.
```
pre-commit run <dbt-gloss hook_id> --all-files --hook-stage push
```
 

### Working with dbt-coverage
- dbt-coverage is a single CLI tool which checks your dbt project for missing documentation and tests. More info found [here](https://github.com/slidoapp/dbt-coverage).
- The command `dbt docs generate` must be run first.
- Once installed, there are 2 main commands to generate test and doc coverage reports:
  - Test Coverage: `dbt-coverage compute test --cov-report coverage-test.json`
  - Doc Coverage: `dbt-coverage compute docs --cov-report coverage-doc.json`
    - Optionally, you may make the run fail if you add `--cov-fail-under 0.5` (range between 0 and 1) to the end of the command, where 0.5 means you must have at least 50% of all docs/tests covered.
- More advanced commands are available in the docs linked above
 
&nbsp;

## Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- [How we structure our dbt projects](https://discourse.getdbt.com/t/how-we-structure-our-dbt-projects/355)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](http://community.getbdt.com/) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
- dbt [Release notes](https://github.com/fishtown-analytics/dbt/releases)
