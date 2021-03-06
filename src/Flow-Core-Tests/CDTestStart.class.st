Class {
	#name : #CDTestStart,
	#superclass : #Object,
	#category : #'Flow-Core-Tests'
}

{ #category : #tests }
CDTestStart >> joinState [
	<flow: #joinState element: #start label: 'Start' outgoing: #self>
	<flow: #joinState element: #decision label: 'Decision' outgoing: #(CDTestState1 joinStateYes CDTestState1 joinStateNo)>
]

{ #category : #tests }
CDTestStart >> test1 [ 
	<flow: #test1 element: #start label: 'Start' outgoing: #self>
	<flow: #test1 element: #state label: 'State1' outgoing: #(CDTestState1 decision1)>
]
