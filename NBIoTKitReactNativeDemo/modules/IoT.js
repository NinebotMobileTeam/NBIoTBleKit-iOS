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
    setImei(text) {
        console.log(text);
    }

    setMacaddress(text) {
        console.log(text);
    }

    setDeviceKey(text) {
        console.log(text);
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
                    <Button style={styles.button} title='connect'></Button>
                    <Button style={styles.button} title='disconnect'></Button>
                    <Button style={styles.button} title='unlock'></Button>
                </View>
                <View style={styles.buttonContainer}>
                    <Button style={styles.button} title='lock'></Button>
                    <Button style={styles.button} title='battery cover'></Button>
                    <Button style={styles.button} title='tailbox'></Button>
                </View>

                <View style={styles.buttonContainer}>
                    <Button style={styles.button} title='iotinfo'></Button>
                    <Button style={styles.button} title='vehicle info'></Button>
                    <Button style={styles.button} title='saddle'></Button>
                </View>
                <Text style={{ flexShrink: 1, flex: 5 }}>
                    asdfasdf
                    asdfasdfasdf

                    asdfasdffas
                    defaultasdf
                    asdfasdffasasdf
                    asdfasdfasdfasd
                    fasdf
                    asdf
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
