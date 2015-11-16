# HE:labs site
[![Build Status][travis_badge]][travis]

This is the HE:labs site, you can see the live site on http://helabs.com.br

## Dependencies

To run this project you need to have:

- Ruby 2.1.2 - You can use [RVM](http://rvm.io)
- Node - You can get Node via `$ brew install node` or on the [website](http://nodejs.org)
- grunt-cli - You can get this via `$ npm install -g grunt-cli` or the [Getting Started guide](http://gruntjs.com/getting-started)

## Setup the project

1. Install the depedencies above
1. Clone the project

        $ git clone git@github.com:Helabs/helabs.github.com.git

1. Go into the project folder

        $ cd helabs.github.com

1. Install the gem dependencies

        $ bundle install

1. Install the grunt dependencies

        $ npm install

If everything goes OK, you can now run the project!

## Running the project

1. Start the server, this will start the jekyll server, will compile your sass files and compile your javascripts.

        $ bundle exec foreman start

1. Open [http://localhost:4000](http://localhost:4000).

## Staging

If you want to test and browse website before you push it to public, use staging.

```sh
$ rake staging
```

Staging version of the website is available at [http://staging.helabs.com.br](http://staging.helabs.com.br).

## CSS

### Editing CSS

You can edit the SCSS files in the [`sass`](https://github.com/Helabs/helabs.github.com/tree/master/sass) folder.
In the [`stylesheets`](https://github.com/Helabs/helabs.github.com/tree/master/stylesheets) folder we have just the generated files by Grunt/Compass.

Do not alter files inside the stylesheets folder and commit them, always use the sass folder.

### Problem with SASS+Git

The Git have a problem with SASS. So when you have a conflict in the generated file by SASS+Compass ([stylesheets/style.css](https://github.com/Helabs/helabs.github.com/blob/master/stylesheets/style.css)), please do not fix this conflict, just delete this conflicted file and generate a new. So you can run this:

```sh
$ git add stylesheets/style.css
$ git rebase --continue
```

## Content

### Adding a project to your profile

* Check if the project exists inside [`_data/mvp.yml`](https://github.com/Helabs/helabs.github.com/blob/master/_data/mvp.yml). If it's there jump to the last step.
* Put a screenshot of the project with 800x465 size and .jpg extension into the [`images/projects/`](https://github.com/Helabs/helabs.github.com/tree/master/images/projects) folder.
* Create a new entry in [`_data/mvp.yml`](https://github.com/Helabs/helabs.github.com/blob/master/_data/mvp.yml) with the following format:

```yaml
  -
    name: project name
    url: external url for the project
    slug: an identifier for the project
    image: /images/projects/my_project.jpg
    description: Describe what the project does
    highlighted: true # if it's highlighted in the http://helabs.com.br/en/work/ page
```

* Open your profile page file. It's inside [`_posts/time`](https://github.com/Helabs/helabs.github.com/tree/master/_posts/time). Add the project slug under `projects` property.

### Creating your profile

Run `rake new_profile` task to generate some basic structure for the "blog post" associated with your profile. The portuguese version of your profile will be found in [`_posts/time`](https://github.com/Helabs/helabs.github.com/tree/master/_posts/time) and the english version in [`_posts/team`](https://github.com/Helabs/helabs.github.com/tree/master/_posts/team).

### Import blogposts

Use this rake task to import blogposts from [http://helabs.com.br/blog/](http://helabs.com.br/blog/) and associate with the author profile.

```sh
$ rake import:blogposts
```

### Remove unused images

If you want to remove unused images use the following rake task.

```sh
$ rake prune_images
```

**Use this carefully!!!**

### Cross origin problems

When you're developing you can receive the error "XMLHttpRequest cannot load http://helabs.com.br/blog/atom.xml. No 'Access-Control-Allow-Origin' header is present on the requested resource. Origin 'http://localhost:4000' is therefore not allowed access" in the console of your browser. To fix it, you need to disable the cross origin policy.

This is how you disable in chrome:

Mac `open -a Google\ Chrome --args --disable-web-security`

Linux `google-chrome --disable-web-security`

Just remember to restart your browser without this option, if you need to navigate in others pages, since this option make your browser vulnerable.



### Integrations

We have an integration using Zapier between the wufoo form on "Fale Conosco" with Pipedrive (CRM), so any changes on fale conosco form need to be updated on Zapier



## Maintainers

- [Marcio Sena](https://github.com/marciovsena)
- [Saulo Santiago](https://github.com/SauloSilva)

## Made with love by HE:labs

![HE:labs](http://helabs.com.br/images/logo.png)

This app was created and is maintained by [HE:labs](https://github.com/Helabs).

[travis]: https://travis-ci.org/Helabs/helabs.github.com
[travis_badge]: http://img.shields.io/travis/Helabs/helabs.github.com/master.svg?style=flat
