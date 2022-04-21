import React from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  FlatList,
  SafeAreaView,
  TouchableHighlight
} from 'react-native';
import { Component } from 'react';

export default class HomePage extends Component {
    constructor(props){
        super(props);
    }

    onPress = (item) => {
        let value = parseInt(item);
        if (value == 0) {
            this.props.navigation.navigate('IoTPage');
        }
    }

    render() {
        return (
            <SafeAreaView style={styles.container}>
                <FlatList
                    data={[
                        {key: 'IoT'},
                        {key: 'Helmet Lock'},
                    ]}
                    renderItem={({ item, index, separators }) => (
                        <TouchableHighlight
                          key={item.key}
                          onPress={() => this.onPress(index)}
                          onShowUnderlay={separators.highlight}
                          onHideUnderlay={separators.unhighlight}
                        >
                          <View style={ styles.row }>
                            <Text>{item.key}</Text>
                          </View>
                        </TouchableHighlight>
                      )}
                    ItemSeparatorComponent={()=> 
                        <View style= {styles.seperator}>
                        </View>
                    }
                />
            </SafeAreaView>
        );
    }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#FFFFFF'
  },
  row: {
    flexDirection: 'row',
    padding: 20,
    fontSize: 18,
    height: 44,
    backgroundColor: '#FFFFFF',
    flexWrap: 'wrap',
    minWidth: '100%',
  },
  seperator: {
    height: 1,
    backgroundColor: '#D6D6D6',
  }
});
