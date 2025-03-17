## Background

I wanted to update a configuration setting that is in use in another repo using a workflow so that this is updated for us and so that this task that can just be forgotten about.

Ideally though for a setting like this you'd have a test that fails, but provides a way for self healing to whatever state it should be.
Either that or wherever this is to be used it is updated during deployment or at runtime. like when someone visits a website (which is where this was required)

## Security concerns

You can set permissions for actions at organisation or repository level, however you probably don't want to allow the actions bot write access across a whole organisation or whole repo and limit it as shown in the workflow, and can read more about this in the official docs [Defining access for the GITHUB_TOKEN scopes](https://docs.github.com/en/actions/writing-workflows/workflow-syntax-for-github-actions#defining-access-for-the-github_token-scopes)

You may require this being raised as a PR like shown using the updateCopyrightYearViaPR.ps1 and the updateCopyrightYearViaPR.yml workflow 

For some reason there's a need to set this `https://github.com/<org>/<repo>/settings/actions` to allow GH Actions to create a PR even with the permissions pull-requests set to write in the workflow yml. 
```
Choose whether GitHub Actions can create pull requests or submit approving pull request reviews.
Allow GitHub Actions to create and approve pull requests
```