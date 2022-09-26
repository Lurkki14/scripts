# Creates a skeleton Qt project with clangd compilation database

#!/usr/bin/env bash

echo '
#include <QtGui>
#include <QApplication>
#include <QLabel>

int main(int argc, char **argv) {
        QApplication app(argc, argv);
        QLabel label("Hello, world!");
        label.show();
        return app.exec();
}
' > Main.cpp &&
	qmake -project &&
	echo "QT += qml gui widgets quick" >> *.pro && 
	qmake && 
	bear -- make
	 
