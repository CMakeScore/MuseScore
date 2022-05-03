/*
 * SPDX-License-Identifier: GPL-3.0-only
 * MuseScore-CLA-applies
 *
 * MuseScore
 * Music Composition & Notation
 *
 * Copyright (C) 2021 MuseScore BVBA and others
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as
 * published by the Free Software Foundation.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

import MuseScore.UiComponents 1.0
import MuseScore.Ui 1.0

Rectangle {
    id: root

    color: ui.theme.backgroundSecondaryColor

    NavigationSection {
        id: navSec
        name: "GeneralComponentsGallery"
        enabled: root.visible
        order: 4
    }

    Flickable {
        id: flickableWrapper

        anchors.fill: parent
        anchors.margins: 12

        contentHeight: contentColumn.implicitHeight

        Column {
            id: contentColumn

            width: parent.width

            spacing: 24

            Repeater {
                width: parent.width

                model: [
                    { textRole: "Dropdown", componentRole: dropdownSample },
                    { textRole: "StyledPopup", componentRole: styledPopupViewComponent },
                    { textRole: "StyledMenu", componentRole: styledMenuComponent },
                    { textRole: "StyledMenuScrollable", componentRole: styledScrollableMenuComponent },
                    { textRole: "CheckBox", componentRole: checkBoxSample },
                    { textRole: "VisibilityBox", componentRole: visibilityBoxSample },
                    { textRole: "ColorPicker", componentRole: colorPickerSample },
                    { textRole: "ExpandableBlank", componentRole: expandableBlankSample },
                    { textRole: "FlatButton", componentRole: flatButtonSample },
                    { textRole: "ProgressButton", componentRole: progressButtonSample },
                    { textRole: "RadioButtonGroup + FlatRadioButton", componentRole: flatRadioButtonSample },
                    { textRole: "RoundedRadioButton", componentRole: roundedRadioButtonSample },
                    { textRole: "IncrementalPropertyControl (Hidden icon, Icon left, Icon right)", componentRole: incrementalPropertyControlSample },
                    { textRole: "FlatToggleButton", componentRole: flatToggleButtonSample },
                    { textRole: "RoundedRectangle (which allows to round the particular corners)", componentRole: roundedRectangleSample },
                    { textRole: "TextInputField", componentRole: textInputFieldSample },
                    { textRole: "SearchField", componentRole: searchFieldSample },
                    { textRole: "FilePicker", componentRole: filePickerSample },
                    { textRole: "DirectoriesPicker", componentRole: directoriesPickerSample },
                    { textRole: "StyledTabBar", componentRole: tabBarSample },
                    { textRole: "PageTabButton", componentRole: pageTabButtonsSample },
                    { textRole: "GridView", componentRole: gridViewVertical },
                    { textRole: "StyledSlider", componentRole: slidersSample },
                    { textRole: "NumberInputField", componentRole: numberInputFieldSample },
                    { textRole: "TimeInputField", componentRole: timeInputFieldSample },
                    { textRole: "ValueList", componentRole: valueListSample }
                ]

                delegate: Column {
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: 8

                    spacing: 24

                    StyledTextLabel {
                        text: modelData["textRole"]
                    }

                    Loader {
                        sourceComponent: modelData["componentRole"]
                    }

                    SeparatorLine { anchors.margins: -18}
                }
            }
        }
    }

    Component {
        id: dropdownSample

        Row {
            spacing: 16

            NavigationPanel {
                id: dropdownNav
                name: "Dropdowns"
                section: navSec
                order: 1
            }

            Dropdown {
                navigation.name: "Dropdown 1"
                navigation.panel: dropdownNav
                navigation.order: 1

                currentIndex: 0

                model: [
                    { text: "1 Option 1", value: 1 },
                    { text: "2 Option 2", value: 2 },
                    { text: "3 Option 3", value: 3 },
                    { text: "4 Option 4", value: 4 },
                    { text: "5 Option 5", value: 5 },
                    { text: "6 Option 6", value: 6 },
                    { text: "7 Option 7", value: 7 },
                    { text: "8 Option 8", value: 8 },
                    { text: "9 Option 9", value: 9 },
                    { text: "10 Option 10", value: 10 },
                    { text: "11 Option 11", value: 11 }
                ]

                onActivated: function(index, value) {
                    currentIndex = index
                }
            }

            Dropdown {
                navigation.name: "Dropdown 2"
                navigation.panel: dropdownNav
                navigation.order: 2

                popupWidth: 200

                currentIndex: 10

                model: [
                    { text: "Option 1", value: 1 },
                    { text: "Option 2", value: 2 },
                    { text: "Option 3", value: 3 },
                    { text: "Option 4", value: 4 },
                    { text: "Option 5", value: 5 },
                    { text: "Option 6", value: 6 },
                    { text: "Option 7", value: 7 },
                    { text: "Option 8", value: 8 },
                    { text: "Option 9", value: 9 },
                    { text: "Option 10", value: 10 },
                    { text: "Option 11", value: 11 }
                ]

                onActivated: function(index, value) {
                    currentIndex = index
                }
            }
        }
    }

    Component {
        id: styledPopupViewComponent

        Row {
            spacing: 12

            FlatButton {
                text: "Show PopupView"

                onClicked: {
                    popupView.toggleOpened()
                }

                StyledPopupView {
                    id: popupView

                    contentWidth: layout.childrenRect.width
                    contentHeight: layout.childrenRect.height

                    Column {
                        id: layout
                        spacing: 12
                        anchors.fill: parent

                        CheckBox {
                            text: "Some checkbox"
                        }

                        FlatButton {
                            text: "Some button"
                        }

                        FlatButton {
                            text: "Accent button 1"
                            accentButton: true
                        }

                        FlatButton {
                            text: "Accent button 2"
                            accentButton: true
                        }
                    }
                }
            }
        }
    }

    Component {
        id: styledMenuComponent

        Row {
            spacing: 12

            FlatButton {
                text: "Show Menu"

                onClicked: {
                    var _subitems = [
                                {id: "2", icon: IconCode.PAGE, title: "first action", enabled: true},
                                {id: "3", icon: IconCode.PAGE, title: "with subitems", enabled: true, subitems: [
                                        {id: "4", title: "first action", enabled: true, selectable: true},
                                        {id: "5", title: "second action", enabled: true, selectable: true, selected: true},
                                        {id: "6", title: "third action", enabled: true, selectable: true},
                                        {},
                                        {id: "7", title: "clear"}
                                    ]}
                            ]

                    var items = [
                                {id: "00", icon: IconCode.PAGE, title: "enabled action", enabled: true},
                                {id: "01", icon: IconCode.AMBITUS, title: "with subitems", enabled: true, shortcut: "Ctrl+A", subitems: _subitems },
                                {},
                                {id: "02", title: "with shortcut", enabled: true, shortcut: "Ctrl+Shift+G"},
                                {id: "03", icon: IconCode.PAGE, title: "disabled action", enabled: false},
                                {id: "04", icon: IconCode.CLEF_BASS, title: "checkable action", enabled: true, checkable: true, checked: true}
                            ]

                    menuLoader.toggleOpened(items)
                }

                StyledMenuLoader {
                    id: menuLoader

                    onHandleMenuItem: function(itemId) {
                        console.log("selected " + itemId)
                    }
                }
            }
        }
    }

    Component {
        id: styledScrollableMenuComponent

        Row {
            spacing: 12

            FlatButton {
                text: "Show Scrollable Menu"

                onClicked: {
                    var items = []

                    for (var i = 0; i < 100; i++) {
                        items.push({id: i, icon: IconCode.PAGE, title: "some action", enabled: true})
                    }

                    menuLoader.toggleOpened(items)
                }

                StyledMenuLoader {
                    id: menuLoader

                    onHandleMenuItem: function(itemId) {
                        console.log("selected " + itemId)
                    }
                }
            }
        }
    }

    Component {
        id: checkBoxSample

        CheckBox {
            width: 200

            text: "Option"
            onClicked: {
                checked = !checked
            }
        }
    }

    Component {
        id: visibilityBoxSample

        Column {
            spacing: 8

            width: 200

            VisibilityBox {
                text: "Visibility Box"

                onVisibleToggled: {
                    isVisible = !isVisible
                }
            }
        }
    }

    Component {
        id: colorPickerSample

        ColorPicker {
            width: 200

            color: "black"

            onNewColorSelected: function(newColor) {
                color = newColor
            }
        }
    }

    Component {
        id: expandableBlankSample

        ExpandableBlank {
            title: isExpanded ? "Collapse me" : "Expand me"

            width: 200

            contentItemComponent: Rectangle {
                implicitHeight: 50
                width: 200

                color: "gray"

                StyledTextLabel {
                    anchors.fill: parent

                    text: "Some content"
                }
            }
        }
    }

    Component {
        id: flatButtonSample

        Column {
            spacing: 8
            width: 200

            FlatButton {
                icon: IconCode.SAVE
                text: "Text with icon"
            }

            FlatButton {
                icon: IconCode.SAVE
                text: "Text with icon"
                orientation: Qt.Horizontal
            }

            FlatButton {
                text: "Just text"
            }

            FlatButton {
                icon: IconCode.SAVE
            }

            FlatButton {
                icon: IconCode.SAVE
                text: "Accent button"
                accentButton: true
            }

            FlatButton {
                icon: IconCode.SAVE
                text: "Flat button"
                transparent: true
            }
        }
    }

    Component {
        id: progressButtonSample

        ProgressButton {
            id: progressButton

            to: 100
            progressStatus: "Processing…"

            Timer {
                id: timer

                interval: 1000
                repeat: true

                onTriggered: {
                    progressButton.value += 10

                    if (progressButton.value === 100) {
                        progressButton.value = 0
                        stop()
                    }
                }
            }

            text: "Start processing"

            onClicked: {
                timer.start()
            }
        }
    }

    Component {
        id: flatRadioButtonSample

        Column {
            spacing: 8

            width: 200

            RadioButtonGroup {
                id: iconButtonList

                property int currentValue: -1

                height: 30

                model: [
                    { iconRole: IconCode.SETTINGS_COG, valueRole: 0 },
                    { iconRole: IconCode.ARROW_DOWN, valueRole: 1 },
                    { iconRole: IconCode.ARROW_UP, valueRole: 2 }
                ]

                delegate: FlatRadioButton {
                    ButtonGroup.group: iconButtonList.radioButtonGroup

                    iconCode: modelData["iconRole"]

                    checked: iconButtonList.currentValue === modelData["valueRole"]
                    onToggled: {
                        iconButtonList.currentValue = modelData["valueRole"]
                    }
                }
            }

            RadioButtonGroup {
                id: textButtonList

                property int currentValue: -1

                height: 30

                model: [
                    { textRole: "Text 1", valueRole: 0 },
                    { textRole: "Text 2", valueRole: 1 },
                    { textRole: "Text 3", valueRole: 2 }
                ]

                delegate: FlatRadioButton {
                    ButtonGroup.group: textButtonList.radioButtonGroup

                    text: modelData["textRole"]

                    checked: textButtonList.currentValue === modelData["valueRole"]
                    onToggled: {
                        textButtonList.currentValue = modelData["valueRole"]
                    }
                }
            }
        }
    }

    Component {
        id: roundedRadioButtonSample

        Row {
            spacing: 12

            RoundedRadioButton {
                text: "Option 1"
            }

            RoundedRadioButton {
                text: "Option 2"
            }

            RoundedRadioButton {
                text: "Option 3"
            }
        }
    }

    Component {
        id: incrementalPropertyControlSample

        Column {
            spacing: 8

            width: 200

            IncrementalPropertyControl {
                currentValue: 0

                maxValue: 999
                minValue: 0
                step: 0.5

                onValueEdited: function(newValue) {
                    currentValue = newValue
                }
            }

            IncrementalPropertyControl {
                icon: IconCode.AUDIO
                iconMode: IncrementalPropertyControl.Right

                currentValue: 0

                maxValue: 999
                minValue: 0
                step: 0.5

                onValueEdited: function(newValue) {
                    currentValue = newValue
                }
            }

            IncrementalPropertyControl {
                icon: IconCode.AUDIO

                currentValue: 0

                maxValue: 999
                minValue: 0
                step: 0.5

                onValueEdited: function(newValue) {
                    currentValue = newValue
                }
            }
        }
    }

    Component {
        id: flatToggleButtonSample

        FlatToggleButton {
            id: lockButton

            height: 20
            width: 20

            icon: checked ? IconCode.LOCK_CLOSED : IconCode.LOCK_OPEN

            onToggled: {
                checked = !checked
            }
        }
    }

    Component {
        id: roundedRectangleSample

        GridLayout {
            columnSpacing: 12
            rowSpacing: 12
            columns: 2

            width: 400

            RoundedRectangle {
                Layout.fillWidth: true
                height: 80

                topLeftRadius: 40

                color: "gray"
                border.color: "red"
                border.width: 3
            }

            RoundedRectangle {
                Layout.fillWidth: true
                height: 80

                topRightRadius: 30

                color: "gray"
                border.color: "yellow"
                border.width: 10
            }

            RoundedRectangle {
                Layout.fillWidth: true
                height: 80

                bottomLeftRadius: 20

                color: "gray"
                border.color: "green"
                border.width: 8
            }

            RoundedRectangle {
                Layout.fillWidth: true
                height: 80

                bottomRightRadius: 10

                color: "gray"
                border.color: "blue"
                border.width: 5
            }
        }
    }

    Component {
        id: textInputFieldSample

        TextInputField {
            height: 40
            width: 200
        }
    }

    Component {
        id: searchFieldSample

        SearchField {}
    }

    Component {
        id: filePickerSample

        FilePicker {
            width: 220

            path: "/some/test/path/foo.txt"

            onPathEdited: {
                path = newPath
            }
        }
    }

    Component {
        id: directoriesPickerSample

        FilePicker {
            width: 220

            pickerType: FilePicker.PickerType.MultipleDirectories

            path: "/some/test/path1;/some/test/path2"

            onPathEdited: {
                path = newPath
            }
        }
    }

    Component {
        id: tabBarSample

        Column {
            width: 200
            spacing: 0

            StyledTabBar {
                id: tabBar
                width: parent.width
                spacing: 12

                StyledTabButton {
                    fillWidth: true
                    text: "Tab 1"
                }

                StyledTabButton {
                    fillWidth: true
                    text: "Tab 2"
                }

                StyledTabButton {
                    fillWidth: true
                    text: "Tab 3"
                }
            }

            StackLayout {
                width: parent.width
                currentIndex: tabBar.currentIndex

                Rectangle {
                    height: 40
                    color: "lightblue"
                }

                Rectangle {
                    height: 40
                    color: "lightgreen"
                }

                Rectangle {
                    height: 40
                    color: "orange"
                }
            }
        }
    }

    Component {
        id: pageTabButtonsSample

        Row {
            spacing: 30

            Column {
                PageTabButton {
                    title: "Tab 1"

                    orientation: Qt.Horizontal

                    width: 200

                    iconComponent: StyledIconLabel {
                        iconCode: IconCode.SAVE
                    }

                    checked: true
                }

                PageTabButton {
                    title: "Tab 2"

                    width: 200

                    orientation: Qt.Horizontal
                }

                PageTabButton {
                    title: "Tab 3"

                    width: 200

                    orientation: Qt.Horizontal
                }
            }

            Column {
                PageTabButton {
                    title: "Tab 1"

                    width: 200

                    iconComponent: StyledIconLabel {
                        iconCode: IconCode.SAVE
                    }

                    checked: true
                }

                PageTabButton {
                    title: "Tab 2"

                    width: 200
                }

                PageTabButton {
                    title: "Tab 3"

                    width: 200
                }
            }
        }
    }

    Component {
        id: gridViewVertical

        Item {

            height: 320
            width: 500

            GridViewSectional {
                id: gridView

                height: parent.height
                width: parent.width

                orientation: Qt.Vertical

                cellWidth: 100
                cellHeight: 36

                sectionWidth: 204
                sectionHeight: 36
                sectionRole: "sectionRole"

                columns: 2

                model: ListModel {
                    ListElement {
                        name: "Text 1"
                        sectionRole: "Section 0"
                    }
                    ListElement {
                        name: "Text 2"
                        sectionRole: "Section 0"
                    }
                    ListElement {
                        name: "Text 5"
                        sectionRole: "Section 0"
                    }
                    ListElement {
                        name: "Text 3"
                        sectionRole: "Section 1"
                    }
                    ListElement {
                        name: "Text 4"
                        sectionRole: "Section 1"
                    }
                }

                sectionDelegate: Rectangle {
                    color: ui.theme.strokeColor

                    property var itemData: Boolean(itemModel) ? itemModel : null

                    width: gridView.sectionWidth
                    height: gridView.sectionHeight

                    StyledTextLabel {
                        anchors.centerIn: parent
                        text: Boolean(itemData) ? itemData : ""
                    }
                }

                itemDelegate: FlatButton {
                    property var item: Boolean(itemModel) ? itemModel : null

                    width: gridView.cellWidth
                    height: gridView.cellHeight

                    text: Boolean(item) ? item.name : ""
                }
            }
        }
    }

    Component {
        id: slidersSample

        Column {
            spacing: 12

            StyledSlider {
                value: 0.25
            }

            StyledSlider {
                orientation: Qt.Vertical
                value: 0.75
            }
        }
    }

    Component {
        id: numberInputFieldSample

        NumberInputField {
            maxValue: 999
            value: 33
        }
    }

    Component {
        id: timeInputFieldSample

        TimeInputField {
            Component.onCompleted: {
                time = new Date(2021, 1, 3, 1, 23, 44, 3)
            }
        }
    }

    Component {
        id: valueListSample

        ValueList {

            width: 560
            height: 226

            keyRoleName: "name"
            keyTitle: "Name"
            valueRoleName: "age"
            valueTitle: "Age"

            model: ListModel {
                ListElement {
                    name: "Alex"
                    age: 12
                    valueType: "Int"
                    min: 1
                    max: 15
                }
                ListElement {
                    name: "Tony"
                    age: 15
                    valueType: "Int"
                }
                ListElement {
                    name: "Fred"
                    age: 10
                    valueType: "Int"
                }
                ListElement {
                    name: "Emma"
                    age: 5
                    valueType: "Int"
                }
                ListElement {
                    name: "Anna"
                    age: 11
                    valueType: "Int"
                }
            }
        }
    }
}
