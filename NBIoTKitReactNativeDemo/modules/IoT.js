import React from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  SafeAreaView,
  TextInput,
  Button
} from 'react-native';
import { Component } from 'react';

export default class IoTPage extends Component {
    logs = "";
    imei = "";
    mac = "";
    deviceKey = "";
    constructor(props) {
        super(props);
        this.logs = "asdfasdfasdfasdfasdfasdfasdfasdfasdfasdf\n";
    }

    setImei(text) {
        console.log(text);
        this.imei = text
    }

    setMacaddress(text) {
        console.log(text);
        this.mac = text
    }

    setDeviceKey(text) {
        console.log(text);
        this.deviceKey = text
    }

    connectOnPress() {
        console.log('connect');
    }

    disconnectOnPress() {
        console.log('disconnect');
    }

    unlockOnPress() {
        console.log('unlock');
    }

    lockOnPress() {
        console.log('lock');
    }

    batteryCoverOnPress() {
        console.log('battery cover');
    }

    tailboxOnPress() {
        console.log('tailbox');
    }

    vehicleInfoOnPress() {
        console.log('vehicle info');
    }

    saddleOnPress() {
        console.log('saddle');
    }

    iotinfoOnPress() {
        console.log('iot info');
    }


    render() {
        return (
            <SafeAreaView style={styles.container}>
                <TextInput
                    style={styles.input}
                    placeholder="IMEI"
                    onChangeText={text => this.setImei(text)}
                />
                <TextInput
                    style={styles.input}
                    placeholder="Mac Address"
                    onChangeText={text => this.setImei(text)}
                />
                <TextInput
                    style={styles.input}
                    placeholder="Device Key"
                    onChangeText={text => this.setImei(text)}
                />

                <View style={styles.buttonContainer}>
                    <Button style={styles.button} title='connect' onPress={this.connectOnPress}></Button>
                    <Button style={styles.button} title='disconnect' onPress={this.disconnectOnPress}></Button>
                    <Button style={styles.button} title='unlock' onPress={this.unlockOnPress}></Button>
                </View>
                <View style={styles.buttonContainer}>
                    <Button style={styles.button} title='lock' onPress={this.lockOnPress}></Button>
                    <Button style={styles.button} title='battery cover' onPress={this.batteryCoverOnPress}></Button>
                    <Button style={styles.button} title='tailbox' onPress={this.tailboxOnPress}></Button>
                </View>

                <View style={styles.buttonContainer}>
                    <Button style={styles.button} title='iotinfo' onPress={this.iotinfoOnPress}></Button>
                    <Button style={styles.button} title='vehicle info' onPress={this.vehicleInfoOnPress}></Button>
                    <Button style={styles.button} title='saddle' onPress={this.saddleOnPress}></Button>
                </View>
                <Text style={{ flexShrink: 1, flex: 5 }}>
                    {this.logs}
                </Text>
            </SafeAreaView>
        );
    }
}

const styles = StyleSheet.create({
  container: {
        flex: 1,
        justifyContent: 'flex-start',
        // alignItems: 'center',
        backgroundColor: '#FFFFFF'
  },
  input: {
        height: 40,
        fontSize: 14,
        padding: 10,
        borderWidth: 1,
        marginTop: 20,
        marginRight:5,
        marginLeft: 5,
        paddingLeft: 5,
        borderColor:'#CCC',
        borderRadius: 10,
  },
  buttonContainer: {
      flex: 1,
      alignContent: 'center',
      flexDirection: 'row',
      alignItems: 'center',
      height: 50,
  },
  button: {
    flex: 1
  }
});
