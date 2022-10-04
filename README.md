# Poutine Shop
### An example dbt project by Montreal Analytics

This repository is an example of [dbt](https://www.getdbt.com/) project best practices and is designed to be used as a reference for other dbt projects.

It contains the data transformation logic for [Montreal Analytics](https://montrealanalytics.com/?utm_source=github&utm_campaign=poutineshop)' fictional Poutine Shop business.

&nbsp;

## Contribution

This project is maintained by the [Montreal Analytics](https://montrealanalytics.com/?utm_source=github&utm_campaign=poutineshop) team with all contributions coming from the team. We add contributions occassionally to highlight new best practices. 

&nbsp;

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

## Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- [How we structure our dbt projects](https://discourse.getdbt.com/t/how-we-structure-our-dbt-projects/355)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [dbt community](http://community.getbdt.com/) to learn from other analytics engineers
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
- dbt [Release notes](https://github.com/fishtown-analytics/dbt/releases)
