apt-get update && apt-get install -y g++ && tar xvf mysql-connector-c++-8.0.13-linux-debian9-x86-64bit.tar && export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/mysql-connector-c++-8.0.13-linux-debian9-x86-64bit/lib64/ && export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/mysql-connector-c++-8.0.13-linux-debian9-x86-64bit/include/ && g++ -std=c++11 -I ./mysql-connector-c++-8.0.13-linux-debian9-x86-64bit/include -L ./mysql-connector-c++-8.0.13-linux-debian9-x86-64bit/lib64 test.cpp -lmysqlcppconn8 -o app && (mysql &) && ./app