#!/bin/sh -x

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

cd "/home/turtlebot/catkin_ws/src/rbx1/rbx1_vision"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
/usr/bin/env \
    PYTHONPATH="/home/turtlebot/catkin_ws/install/lib/python2.7/dist-packages:/home/turtlebot/catkin_ws/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/turtlebot/catkin_ws/build" \
    "/usr/bin/python" \
    "/home/turtlebot/catkin_ws/src/rbx1/rbx1_vision/setup.py" \
    build --build-base "/home/turtlebot/catkin_ws/build/rbx1/rbx1_vision" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/turtlebot/catkin_ws/install" --install-scripts="/home/turtlebot/catkin_ws/install/bin"
