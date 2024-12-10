"use client"
import React, { useContext, useEffect, createContext, useReducer, useState} from 'react'
import { products } from '../user/data';

const OrderContext = createContext();

const ACTIONS = {
    ADD_ORDER: 'ADD_ORDER',
    REMOVE_ORDER: 'REMOVE_ORDER'
}

const reducer = (state, action) => {
    switch(action.type) {
        case ACTIONS.ADD_ORDER:
            return {
               ...state,
                orderList: [...state.orderList, action.payload]
            }
        case ACTIONS.REMOVE_ORDER:
            return {
               ...state,
                orderList: state.orderList.filter(order => order.id !== action.payload.id)
            }
        // default:
        //     return state;
    }
}

export const OrderProvider = ({ children }) => {
    const [state, dispatch] = useReducer(reducer, { orderList: [] });
    const [selectedProduct, setSelectedProduct] = useState();
    
    const addOrder = (order) => {
        dispatch({ type: ACTIONS.ADD_ORDER, payload: order })
    }

    const removeOrder = (id) => {
        dispatch({ type: ACTIONS.REMOVE_ORDER, payload: { id } })
    }

  return (
    <OrderContext.Provider value={{ addOrder, removeOrder, state, selectedProduct, setSelectedProduct }}>
      { children }
    </OrderContext.Provider>
  )
}

export const useOrder = () => {
    return (
        useContext(OrderContext)
    )
}