Class {
	#name : #CDFlowEntity,
	#superclass : #Object,
	#instVars : [
		'label',
		'outgoing',
		'incoming'
	],
	#category : #'Flow-Core-Model'
}

{ #category : #'instance creation' }
CDFlowEntity class >> labelled: aString [ 
	^ self new 
		label: aString
]

{ #category : #'instance creation' }
CDFlowEntity class >> withName: aString [
	^ self allSubclasses 
		detect: [ :each | each stateObjectName = aString ]
		ifNone: [  nil ]
]

{ #category : #accessing }
CDFlowEntity >> addIncoming: anObject [
	(incoming includes: anObject) ifFalse: [   
		incoming add: anObject.  
		(anObject respondsTo: #outgoing:) ifTrue: [ 
			anObject outgoing: self ] ]
]

{ #category : #'as yet unclassified' }
CDFlowEntity >> anyIncoming [
	^ incoming anyOne
]

{ #category : #accessing }
CDFlowEntity >> basicSize [ 
	^ 200
]

{ #category : #'public - shape' }
CDFlowEntity >> border [
	^ RSBorder new 
		width: 5; 
		color: Color darkGray
]

{ #category : #accessing }
CDFlowEntity >> fontSize [
	^ 15
]

{ #category : #accessing }
CDFlowEntity >> incoming [
	^ incoming
]

{ #category : #initialization }
CDFlowEntity >> initialize [ 
	super initialize.
	incoming := Set new.
]

{ #category : #accessing }
CDFlowEntity >> label [
	^ label
]

{ #category : #accessing }
CDFlowEntity >> label: anObject [
	label := anObject
]

{ #category : #accessing }
CDFlowEntity >> outgoing [
	^ outgoing
]

{ #category : #accessing }
CDFlowEntity >> outgoing: anObject [
	outgoing := anObject
]

{ #category : #printing }
CDFlowEntity >> printOn: aStream [
	aStream << self class name << ' - ' << label asString
]

{ #category : #'as yet unclassified' }
CDFlowEntity >> resolve: aCollection builder: aBuilder [ 
	outgoing := aBuilder resolve: aCollection first.
	outgoing addIncoming: self.
]

{ #category : #accessing }
CDFlowEntity >> shapeSize [
	^ self basicSize 
]
