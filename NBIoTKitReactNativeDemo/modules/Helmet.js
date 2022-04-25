import React from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  SafeAreaView,
  TextInput,
  Button,
  NativeModules,
  NativeEventEmitter,
  ScrollView

} from 'react-native';
import { Component } from 'react';

const { NBHelmetRNModule } = NativeModules

const NBHelmetBleRNEventEmitter = new NativeEventEmitter(NBHelmetRNModule)

export default class HelmetPage extends Component {
    state = {
        imei: "",
        mac: "",
        deviceKey: "",
        logs: ""
    };

    scrollView = null;

    constructor(props) {
        super(props);
    }

    componentDidMount() {
        NBHelmetBleRNEventEmitter.addListener(
            'connectionStateChange', (state) => this.connectionStateChanged(state)
        );

        NBHelmetBleRNEventEmitter.addListener(
            'connectDeviceOnError', (error) => this.connectDeviceOnError(error)
        );

        NBHelmetBleRNEventEmitter.addListener(
            'bluetoothStateChanged', (state) => this.bluetoothStateChanged(state)
        );
    }

    componentWillUnmount() {
        NBHelmetBleRNEventEmitter.removeAllListeners('connectionStateChange')
        NBHelmetRNModule.disconnect();
    }

    connectionStateChanged(state) {
        this.appendLog('connectionStateChange');
        this.appendLog(state);
        if (state == NBHelmetRNModule.ConnectionStateDisconnected) {
            this.appendLog('disconnected');
        } else if (state == NBHelmetRNModule.ConnectionStateConnected) {
            this.appendLog('connected');
        }
    }

    connectDeviceOnError(error) {
        this.appendLog('connectDeviceOnError');
        this.appendLog(error);
    }

    bluetoothStateChanged(state) {
        this.appendLog('bluetoothStateChanged');
        this.appendLog(state);
        switch (state) {
            case NBHelmetRNModule.CBManagerStateUnknown:
                this.appendLog('CBManagerStateUnknown');
            case NBHelmetRNModule.CBManagerStateResetting:
                this.appendLog('CBManagerStateResetting');
            case NBHelmetRNModule.CBManagerStateUnsupported:
                this.appendLog('CBManagerStateUnsupported');
            case NBHelmetRNModule.CBManagerStateUnauthorized:
                this.appendLog('CBManagerStateUnauthorized');
            case NBHelmetRNModule.CBManagerStatePoweredOff:
                this.appendLog('CBManagerStatePoweredOff');
            case NBHelmetRNModule.CBManagerStatePoweredOn:
                this.appendLog('CBManagerStatePoweredOn');
            default:
                this.appendLog('default');
        }
    }
    
    setMacaddress(text) {
        this.appendLog(text);
        this.setState({
            mac: text
        })
    }

    setDeviceKey(text) {
        this.appendLog(text);
        this.setState({
            deviceKey: text
        })
    }

    connectOnPress() {
        this.appendLog('connect');
        this.appendLog(this.state.imei);
        this.appendLog(this.state.mac);
        this.appendLog(this.state.deviceKey);
        NBHelmetRNModule.connectDeviceByMacAddress(this.state.mac, this.state.deviceKey);
    }

    disconnectOnPress() {
        this.appendLog('disconnect');
        NBHelmetRNModule.disconnect();
    }

    async unlockOnPress() {
        this.appendLog('unlock');
        try {
            const result = await NBHelmetRNModule.unlock();
            this.appendLog(result);
        } catch (error) {
            this.appendLog(error);
        }
    }

    async queryLockStatusOnPress() {
        this.appendLog('queryLockStatusOnPress');
        try {
            const result = await NBHelmetRNModule.queryLockStatus();
            this.appendLog(result);
        } catch (error) {
            this.appendLog(error);
        }
    }

    async queryLockInfoOnPress() {
        this.appendLog('queryLockInfoOnPress');
        try {
            const result = await NBHelmetRNModule.queryIoTInformation();
            this.appendLog(result);
        } catch (error) {
            this.appendLog(error);
        }
    }

    appendLog(text) {
        console.log(text);
        this.setState({
            logs: this.state.logs + text + "\n"
        })
        if (this.scrollView != null) {
            this.scrollView.scrollToEnd();
        }
    }

    render() {
        return (
            <SafeAreaView style={styles.container}>
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
                    <Button style={styles.button} title='connect' onPress={()=>this.connectOnPress()}></Button>
                    <Button style={styles.button} title='disconnect' onPress={()=>this.disconnectOnPress()}></Button>
                </View>
                <View style={styles.buttonContainer}>
                    <Button style={styles.button} title='unlock'></Button>
                    <Button style={styles.button} title='query lock status'></Button>
                    <Button style={styles.button} title='query lock info'></Button>
                </View>

                <View style={ { flex: 5} }>
                    <ScrollView ref={(scrollView) => { this.scrollView = scrollView }}>
                        <Text style={{ margin: 10}}>
                            {this.state.logs}
                        </Text>
                    </ScrollView>
                </View>
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
    //   flex: 1,
      alignContent: 'center',
      flexDirection: 'row',
      alignItems: 'center',
      height: 50,
  },
  button: {
    flex: 1,
    height: 44,
    borderWidth: 1,
    borderColor: 'blue',
    borderRadius: 10,
  }
});
