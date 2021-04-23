CFLAGS="-D FOR_OCCLUM" ./configure --prefix=/opt/python-occlum --with-pydebug
make -j$(nproc)
make install
rm -rf $HOME/python-mp-test
occlum new $HOME/python-mp-test
cp Occlum.json $HOME/python-mp-test
cp time_fork.py $HOME/python-mp-test/image
cp -r /opt/python-occlum $HOME/python-mp-test/image/opt/
cp /opt/occlum/glibc/lib/libdl.so.2 $HOME/python-mp-test/image/opt/occlum/glibc/lib/
cp /opt/occlum/glibc/lib/libutil.so.1 $HOME/python-mp-test/image/opt/occlum/glibc/lib/
cp /opt/occlum/glibc/lib/librt.so.1 $HOME/python-mp-test/image/opt/occlum/glibc/lib/
cd $HOME/python-mp-test && occlum build -f
occlum run /opt/python-occlum/bin/python3.10 /time_fork.py
