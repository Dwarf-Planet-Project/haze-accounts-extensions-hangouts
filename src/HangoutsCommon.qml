import QtQuick 2.0
import Sailfish.Silica 1.0
import com.jolla.settings.accounts 1.0

Column {
    property bool editMode
    property bool usernameEdited
    property bool passwordEdited
    property bool oAuthEdited
    property bool acceptAttempted
    property alias username: usernameField.text
    property alias password: passwordField.text
    property alias oauth: oAuthField.text
    property bool acceptableInput: username != "" && password != "" && oauth != ""

    width: parent.width

    TextField {
        id: usernameField
        visible: !editMode
        width: parent.width
        inputMethodHints: Qt.ImhNoPredictiveText | Qt.ImhNoAutoUppercase
        errorHighlight: !text && acceptAttempted

        //: Placeholder text for XMPP username
        //% "Enter username"
        placeholderText: qsTrId("components_accounts-ph-jabber_username_placeholder")
        //: XMPP username
        //% "Username"
        label: qsTrId("components_accounts-la-jabber_username")
        onTextChanged: {
            if (focus) {
                usernameEdited = true
                // Updating username also updates password; clear it if it's default value
                if (!passwordEdited)
                    passwordField.text = ""
            }
        }
        EnterKey.iconSource: "image://theme/icon-m-enter-next"
        EnterKey.onClicked: passwordField.focus = true
    }

    TextField {
        id: passwordField
        visible: !editMode
        width: parent.width
        inputMethodHints: Qt.ImhNoPredictiveText | Qt.ImhNoAutoUppercase
        echoMode: TextInput.Password
        errorHighlight: !text && acceptAttempted

        //: Placeholder text for password
        //% "Enter password"
        placeholderText: qsTrId("components_accounts-ph-jabber_password_placeholder")
        //: XMPP password
        //% "Password"
        label: qsTrId("components_accounts-la-jabber_password")
        onTextChanged: {
            if (focus && !passwordEdited) {
                passwordEdited = true
            }
        }
        EnterKey.iconSource: "image://theme/icon-m-enter-next"
        EnterKey.onClicked: oAuthfield.focus = true
    }
    
    TextField {
        id: oAuthField
        visible: !editMode
        width: parent.width
        inputMethodHints: Qt.ImhNoPredictiveText | Qt.ImhNoAutoUppercase
	echoMode: TextInput.Password
        errorHighlight: !text && acceptAttempted

        //: Placeholder text for oAuth 
        //% "Enter oAuth"
        placeholderText: "Please add the oAuth code for Hangouts"
        //: oAuthCode
        //% "oAuthCode"
        label: "oauth_code"
        onTextChanged: {
            if (focus) {
                oAuthEdited = true
                // Updating username also updates password; clear it if it's default value
            }
        }
        EnterKey.iconSource: "image://theme/icon-m-enter-next"
        EnterKey.onClicked: focus = false
    }
}
