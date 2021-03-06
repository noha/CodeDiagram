Class {
	#name : #CDState,
	#superclass : #CDFlowEntity,
	#category : #'Flow-Core-Model'
}

{ #category : #'as yet unclassified' }
CDState class >> stateObjectName [
	^ #state
]

{ #category : #visiting }
CDState >> acceptStateVisitor: aStateObjectVisitor [ 
	^ aStateObjectVisitor visitState: self
]

{ #category : #'as yet unclassified' }
CDState >> shape [
	| shapeBuilder labelShape |
	shapeBuilder := RSMultilineLabelBuilder new.
	shapeBuilder labelShape
		fontSize: self fontSize.
	labelShape := (shapeBuilder shapeFor: label).

	^ RSComposite new 
		model: self;
		shapes: {
			RSShapeFactory box 
				cornerRadius: (self shapeSize / 10);
				border: self border;
				color: #lightBlue;
				extent: (Point x: labelShape width + 20 y: 150).
		labelShape }
]
