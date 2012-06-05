Clone it :

	$ git clone git@github.com:VarnaLab/VarnaLab-Site.git
	$ cd VarnaLab-Site
	
To setup rvm (only once) :

	$ echo rvm --create use 1.9.2@varnalab_site >> .rvmrc
	$ rvm use 1.9.2@varnalab_site

To start it : 

	$ bundle
	$ rake db:create db:migrate
	$ rails s 
	
Check : <http://localhost:3000> and <http://localhost:3000/admin>