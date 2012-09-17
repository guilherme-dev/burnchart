Server for connect to GitHub Issues API and displaying a burndown chart for a current milestone.

## Requirements:

You can install all the following dependencies by running:

```bash
$ npm install -d
```

- [CoffeeScript](http://coffeescript.org/)
- [express](http://expressjs.com/)
- [eco](https://github.com/sstephenson/eco)
- [js-yaml](https://github.com/visionmedia/js-yaml)

## Configure:

The app is configured by pointing to a public GitHub user/project. Do so in `config.yml`:

```yaml
github_user:    'intermine'
github_project: 'InterMine'
project_name:   'Core InterMine Project'
```

The `project_name` key-value pair represents the title of the burndown chart that you will see in the top right corner of the page.

### Milestones

Then visit your GitHub project's Issues page and create a new milestone with a date due in the future. This will represent your iteration. This app will pick the Milestone with the **closest due date in the future** as the *current* one.

### Sizes

Then assign a few labels to tickets in this Milestone. These labels will represent your perceived size of the task. The label takes a form of *size [number]* so to say that an Issue is as big as *5* points I would create and assign this label (don't worry about the colors...):

```
size 5
```

## Use:

```bash
$ npm start
```

Then visit [http://127.0.0.1:3000/](http://127.0.0.1:3000/).

There is nothing to save in a database so each refresh of the page fetches all of the latest information from GitHub.

Enjoy!

## Example:

![image](https://raw.github.com/radekstepan/github-burndown-chart/master/example.png)