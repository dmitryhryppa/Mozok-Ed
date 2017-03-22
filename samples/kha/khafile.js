let project = new Project('Game');

project.addSources('../../client');

project.addAssets('Assets/**');
project.addSources('Sources');

resolve(project);