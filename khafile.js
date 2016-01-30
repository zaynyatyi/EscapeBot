var project = new Project('EscapeBot');

project.addSources('src');
project.addAssets('assets/**');

project.addLibrary('nape');

return project;