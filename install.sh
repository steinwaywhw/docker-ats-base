
# install essentials
apt-get -qq install -y wget libgmp3-dev libgc-dev make gcc build-essential git \
				               bash libjson-c-dev pkg-config openjdk-8-jdk unzip zsh
        
# install scheme/nodejs/python
apt-get -qq install -y mit-scheme nodejs python3 python2.7 python

# install erlang/elixir
cd /tmp
wget http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb
dpkg -i erlang-solutions_1.0_all.deb
apt-get -qq update
apt-get -qq install -yq esl-erlang elixir

# install clojure
cd ${HOME}
wget http://repo1.maven.org/maven2/org/clojure/clojure/1.8.0/clojure-1.8.0.zip
unzip clojure-1.8.0.zip && rm clojure-1.8.0.zip
echo "export CLASSPATH=\${HOME}/clojure-1.8.0/*:\${CLASSPATH}:" >> ${HOME}/.bashrc

# install emscripten
cd ${HOME}
wget https://s3.amazonaws.com/mozilla-games/emscripten/releases/emsdk-portable.tar.gz
tar -xzf emsdk-portable.tar.gz && rm emsdk-portable.tar.gz
apt-get install -qq -y cmake default-jre

cd emsdk_portable
./emsdk update
./emsdk install latest
./emsdk activate latest
source ./emsdk_env.sh

# install z3
cd ${HOME}
git clone https://github.com/Z3Prover/z3
cd ${HOME}/z3 && python scripts/mk_make.py 
cd ${HOME}/z3/build && make && make install

apt-get clean
