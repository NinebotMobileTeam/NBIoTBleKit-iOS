import React, { Component } from 'react';
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

const { NBIoTBleRNModule } = NativeModules

const NBIoTBleRNEventEmitter = new NativeEventEmitter(NBIoTBleRNModule)

export default class IoTPage extends Component {
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
        NBIoTBleRNEventEmitter.addListener(
            'connectionStateChange', (state) => this.connectionStateChanged(state)
        );

        NBIoTBleRNEventEmitter.addListener(
            'connectDeviceOnError', (error) => this.connectDeviceOnError(error)
        );

        NBIoTBleRNEventEmitter.addListener(
            'bluetoothStateChanged', (state) => this.bluetoothStateChanged(state)
        );
    }

    componentWillUnmount() {
        NBIoTBleRNEventEmitter.removeAllListeners('connectionStateChange')
        NBIoTBleRNModule.disconnect();
    }

    connectionStateChanged(state) {
        this.appendLog('connectionStateChange');
        this.appendLog(state);
        if (state == NBIoTBleRNModule.ConnectionStateDisconnected) {
            this.appendLog('disconnected');
        } else if (state == NBIoTBleRNModule.ConnectionStateConnected) {
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
            case NBIoTBleRNModule.CBManagerStateUnknown:
                this.appendLog('CBManagerStateUnknown');
            case NBIoTBleRNModule.CBManagerStateResetting:
                this.appendLog('CBManagerStateResetting');
            case NBIoTBleRNModule.CBManagerStateUnsupported:
                this.appendLog('CBManagerStateUnsupported');
            case NBIoTBleRNModule.CBManagerStateUnauthorized:
                this.appendLog('CBManagerStateUnauthorized');
            case NBIoTBleRNModule.CBManagerStatePoweredOff:
                this.appendLog('CBManagerStatePoweredOff');
            case NBIoTBleRNModule.CBManagerStatePoweredOn:
                this.appendLog('CBManagerStatePoweredOn');
            default:
                this.appendLog('default');
        }
    }

    setImei(text) {
        this.appendLog(text);
        this.setState({
            imei: text
        })
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
        NBIoTBleRNModule.connectDeviceByIMEI(this.state.imei, this.state.mac, this.state.deviceKey);
    }

    disconnectOnPress() {
        this.appendLog('disconnect');
        NBIoTBleRNModule.disconnect();
    }

    async unlockOnPress() {
        this.appendLog('unlock');
        try {
            const result = await NBIoTBleRNModule.unlock();
            this.appendLog(result);
        } catch (error) {
            this.appendLog(error);
        }
    }

    async lockOnPress() {
        this.appendLog('lock');
        try {
            const result = await NBIoTBleRNModule.lock();
            this.appendLog(result);
        } catch (error) {
            this.appendLog(error);
        }
    }

    async batteryCoverOnPress() {
        this.appendLog('battery cover');
        try {
            const result = await NBIoTBleRNModule.openBatteryCover();
            this.appendLog(result);
        } catch (error) {
            this.appendLog(error);
        }
    }

    async tailboxOnPress() {
        this.appendLog('tailbox');
        try {
            const result = await NBIoTBleRNModule.openTailBox();
            this.appendLog(result);
        } catch (error) {
            this.appendLog(error);
        }
    }

    async vehicleInfoOnPress() {
        this.appendLog('vehicle info');
        try {
            const result = await NBIoTBleRNModule.queryVehicleInformation();
            this.appendLog(result);
        } catch (error) {
            this.appendLog(error);
        }
    }

    async saddleOnPress() {
        this.appendLog('saddle');
        try {
            const result = await NBIoTBleRNModule.openSaddle();
            this.appendLog(result);
        } catch (error) {
            this.appendLog(error);
        }
    }

    async iotinfoOnPress() {
        this.appendLog('iot info');
        try {
            const result = await NBIoTBleRNModule.queryIoTInformation();
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
                    placeholder="IMEI"
                    defaultValue={this.state.imei}
                    onChangeText={text => this.setImei(text)}
                />
                <TextInput
                    style={styles.input}
                    placeholder="Mac Address"
                    defaultValue={this.state.mac}
                    onChangeText={text => this.setMacaddress(text)}
                />
                <TextInput
                    style={styles.input}
                    placeholder="Device Key"
                    defaultValue={this.state.deviceKey}
                    onChangeText={text => this.setDeviceKey(text)}
                />

                <View style={styles.buttonContainer}>
                    <Button style={styles.button} title='connect' onPress={() => this.connectOnPress()}></Button>
                    <Button style={styles.button} title='disconnect' onPress={() => this.disconnectOnPress()}></Button>
                    <Button style={styles.button} title='unlock' onPress={() => this.unlockOnPress()}></Button>
                </View>
                <View style={styles.buttonContainer}>
                    <Button style={styles.button} title='lock' onPress={() => this.lockOnPress()}></Button>
                    <Button style={styles.button} title='battery cover' onPress={() => this.batteryCoverOnPress()}></Button>
                    <Button style={styles.button} title='tailbox' onPress={() => this.tailboxOnPress()}></Button>
                </View>

                <View style={styles.buttonContainer}>
                    <Button style={styles.button} title='iotinfo' onPress={() => this.iotinfoOnPress()}></Button>
                    <Button style={styles.button} title='vehicle info' onPress={() => this.vehicleInfoOnPress()}></Button>
                    <Button style={styles.button} title='saddle' onPress={() => this.saddleOnPress()}></Button>
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
        marginRight: 5,
        marginLeft: 5,
        paddingLeft: 5,
        borderColor: '#CCC',
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
