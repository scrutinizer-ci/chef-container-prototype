# Chef Container Prototype

This repository contains a prototype for building a custom image using Chef recipes.


## Installation

Make sure that you have ``chef`` and ``vagrant`` installed locally:

- [Installing chef](http://www.getchef.com/chef/install/)
- [Installing vagrant](https://www.vagrantup.com/downloads.html)

Chef provides us several short cuts for downloading and generating cookbooks through ``knife``, and ``vagrant`` allows us
to test our changes locally before triggering a build on Scrutinizer.

Now that you have installed all dependencies, simply clone this repository:

```
git clone git://github.com/scrutinizer/chef-container-prototype my-container
git remote set-url origin git@github.com:your-login/my-container.git
```

[Add the new repository on Scrutinizer](https://scrutinizer-ci.com/g/new) and push your changes to your repository:

```
git push -u origin master
```

You should now see a first build of your container being triggered on Scrutinizer.


## Building Box Locally

During development, you typically iterate on your box locally before committing your changes and triggering a build on
Scrutinizer. If you installed vagrant, just run

```
vagrant up
```

This will fetch the base box and run your chef recipes. If your box is already running, you can instead run

```
vagrant provision
```


## Further Resources

- [Chef Documentation](http://docs.opscode.com/)
