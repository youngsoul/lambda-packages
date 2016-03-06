# psycopg2

postgreSQL 9.5.1
psycopg2 2.6.1

Instructions (via [Dr-Z0idberg](https://www.reddit.com/r/aws/comments/3on09a/using_psycopg2_in_lambda/cw4s94n)):

* Downloaded the Postgresql 9.4.3 source code and extracted it.
* Downloaded the psycopg2 source and extracted it.
* Went into the Postgresql source directory and did "./configure --prefix {path_to_pg_source_dir} --without-readline --without-zlib" followed by "make" followed by "make install". This generated a pg_config file in a bin directory.
* I then went into the psycopg2 directory and edited the setup.cfg file and set pg_config={path_to_pg_source/bin/pg_config} and static_libpq=1
* Then execute python setup.py build and copied the resulting psycopg2 package from the build directory into my local machine and bundle it inside the AWS package.
