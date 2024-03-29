// src/redux/reducers/trafficReducer.jsx

import { CHANGE_SIGNAL } from '../actions';

const initialState = {
  signal: { color: 'red' },
};

function trafficReducer(state = initialState, action) {
  switch (action.type) {
  case CHANGE_SIGNAL:
    return {
      ...state,
      signal: { ...state.signal, color: action.payload },
    };
  default:
    return state;
  }
}

export default trafficReducer;
