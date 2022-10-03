<!---
Provide a short summary in the Title above using the Conventional Commit standard (https://www.conventionalcommits.org/en/v1.0.0/#summary). Examples of good PR titles:
* "feat: add so-and-so models"
* "fix: deduplicate such-and-such"
* "chore: bump dbt version to 1.0.1"
-->

## Description & motivation
<!---
Describe your changes, and why you're making them. Is this linked to an open
issue, a ClickUp task, or another pull request? Link it here.
-->

## To-do before merge
<!---
(Optional -- remove this section if not needed)
Include any notes about things that need to happen before this PR is merged, e.g.:
- [ ] Change the base branch
- [ ] Update dbt Cloud jobs
- [ ] Ensure PR #56 is merged
-->

## Screenshots:
<!---
Include a screenshot of the relevant section of the updated DAG. You can access
your version of the DAG by running `dbt docs generate && dbt docs serve`.
-->

## Validation of models:
<!---
Include any output that confirms that the models do what is expected. This might
be a link to an in-development dashboard in your BI tool, or a query that
compares an existing model with a new one.
-->

## Changes to existing models:
<!---
Include this section if you are changing any existing models. Link any related
pull requests on your BI tool, or instructions for merge (e.g. whether old
models should be dropped after merge, or whether a full-refresh run is required)
-->

## Checklist:
<!---
This checklist is mostly useful as a reminder of small things that can easily be
forgotten – it is meant as a helpful tool rather than hoops to jump through.
Put an `x` in all the items that apply, make notes next to any that haven't been
addressed, and remove any items that are not relevant to this PR.
-->
- [ ] My pull request represents one logical piece of work.
- [ ] My commits are related to the pull request and look clean.
- [ ] My SQL follows the [dbt Labs style guide](https://github.com/dbt-labs/corp/blob/master/dbt_style_guide.md).
- [ ] I have materialized my models appropriately.
- [ ] I have added appropriate tests and documentation to any new models.
- [ ] I have updated the README file.

<!---
Provided by dbt Labs: https://docs.getdbt.com/blog/analytics-pull-request-template
-->
