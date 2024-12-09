"use client"
import React, { useContext, useEffect, createContext, useReducer} from 'react'

const OrderContext = createContext();

const ACTIONS = {
    ADD_ORDER: 'ADD_ORDER',
    REMOVE_ORDER: 'REMOVE_ORDER'
}

const reducer = (state, action) => {
    switch(action.type) {
        case ACTION.ADD_ORDER:
            return {
               ...state,
                orders: [...state.orders, action.payload.order]
            }
        case ACTION.REMOVE_ORDER:
            return {
               ...state,
                orders: state.orders.filter(order => order.id !== action.payload.id)
            }
        default:
            return state;
    }
}

const initialState = {
    orders: []
}

export const OrderProvider = ({ children }) => {
    const [state, dispatch] = useReducer(reducer, initialState);
    
    const addOrder = (order) => {
        dispatch({ type: ACTIONS.ADD_ORDER, payload: { order } })
    }

    const removeOrder = (id) => {
        dispatch({ type: ACTIONS.REMOVE_ORDER, payload: { id } })
    }

  return (
    <OrderContext.Provider value={{ addOrder, removeOrder, state }}>
      { children }
    </OrderContext.Provider>
  )
}

export const useOrder = () => {
    return (
        useContext(OrderContext)
    )
}