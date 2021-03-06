/**
 * CarBudget, Sailfish application to manage car cost
 *
 * Copyright (C) 2014 Fabien Proriol
 *
 * This file is part of CarBudget.
 *
 * CarBudget is free software: you can redistribute it and/or modify it under the terms of the
 * GNU General Public License as published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * CarBudget is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
 * without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
 * See the GNU General Public License for more details. You should have received a copy of the GNU
 * General Public License along with CarBudget. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Fabien Proriol
 */


import QtQuick 2.0
import Sailfish.Silica 1.0


Page {
    id: page
    allowedOrientations: Orientation.All
    // To enable PullDownMenu, place our content in a SilicaFlickable
    SilicaFlickable {
        anchors.fill: parent

        // PullDownMenu and PushUpMenu must be declared in SilicaFlickable, SilicaListView or SilicaGridView
        PullDownMenu {
            enabled: manager.is_debug
            visible: manager.is_debug

            MenuItem {
                text: qsTr("Simulation")
                onClicked: {
                    manager.car.simulation()
                }
            }
        }


        // Tell SilicaFlickable the height of its content.
        contentHeight: column.height

        // Place our content in a Column.  The PageHeader is always placed at the top
        // of the page, followed by our content.
        Column {
            id: column
            anchors.fill: parent
            spacing: Theme.paddingLarge
            PageHeader {
                title: "CarBudget " + Qt.application.version
            }

            Label {
                x: Theme.paddingLarge
                width: parent.width - Theme.paddingLarge*2
                text: qsTr("License: GPLv3")
                font.pixelSize: Theme.fontSizeSmall
            }
            Label {
                x: Theme.paddingLarge
                width: parent.width - Theme.paddingLarge*2
                text: qsTr("Created by condo4 (Fabien Proriol)")
                font.pixelSize: Theme.fontSizeSmall
            }

            Label {
                x: Theme.paddingLarge
                width: parent.width - Theme.paddingLarge*2
                wrapMode: Text.Wrap
                text: qsTr("Credits to:<br />- Lorenzo Facca (Italian translation)<br />- Alois Spitzbart (German translation)<br />- Michal Hrusecky (Many improvements)<br />- Denis Fedoseev (Russian translation)<br />- Åke Engelbrektson (Swedish translation)<br />- Thomas Michel (Many improvements)<br />- Matti Viljanen (Finnish translation and many improvements)")
                font.pixelSize: Theme.fontSizeSmall
            }

            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                source: "qrc:/GitHub_Logo_White.png"
                width: 220 * Screen.widthRatio
                height: 100 * Screen.widthRatio
                fillMode: Image.PreserveAspectFit
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        Qt.openUrlExternally("https://github.com/condo4/carbudget")
                    }
                }
            }

            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                text: qsTr("Sourcecode on Github")
            }

        }
    }
}
