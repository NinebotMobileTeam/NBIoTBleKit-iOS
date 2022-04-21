import { AppRegistry } from "react-native"
import * as React from 'react';
import { View, Text } from 'react-native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { NavigationContainer } from '@react-navigation/native';
import HomePage from "./NBIoTKitReactNativeDemo/modules/HomePage";
import { Component } from "react/cjs/react.production.min";
import IoTPage from "./NBIoTKitReactNativeDemo/modules/IoT";
import HelmetPage from "./NBIoTKitReactNativeDemo/modules/Helmet";

const Stack = createNativeStackNavigator();

// const App = () => {
//     return (
//         <NavigationContainer>
//             <Stack.Navigator initialRouteName="HomePage">
//                 <Stack.Screen name="HomePage" component={HomePage} />
//             </Stack.Navigator>
//         </NavigationContainer>
//     )
// }

function HomeScreen({ route, navigation }) {
    return (
        <HomePage navigation={navigation}></HomePage>
    )
};

function IoTScreen() {
    return (
        <IoTPage></IoTPage>
    )
}

function HelmetScreen() {
    return (
        <HelmetPage></HelmetPage>
    )
}

export default function App() {
    return (
        <NavigationContainer>
            <Stack.Navigator initialRouteName="HomePage">
                <Stack.Screen name="HomePage" component={HomeScreen} />
                <Stack.Screen name="IoTPage" component={IoTScreen} />
                <Stack.Screen name="HelmetScreen" component={HelmetScreen} />
            </Stack.Navigator>
        </NavigationContainer>
    )
}
  

// Module name
AppRegistry.registerComponent('App', () => App);