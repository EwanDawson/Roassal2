"
I am a line that can be styled with arrow ends and whose path is specified by SVG path.

I am used as a line, if you need a regular shape, use RTSVGPath.
"
Class {
	#name : #RTSVGPathLine,
	#superclass : #RTAbstractLine,
	#instVars : [
		'path'
	],
	#category : #'Roassal2-Shapes'
}

{ #category : #accessing }
RTSVGPathLine >> path [
	^ path
]

{ #category : #accessing }
RTSVGPathLine >> path: aString [
	path := aString
]

{ #category : #accessing }
RTSVGPathLine >> pathFor: anEdge [
	^ path rtValue: anEdge
]

{ #category : #hooks }
RTSVGPathLine >> trachelShapeClass [
	^ TRSVGPathLineShape
]

{ #category : #public }
RTSVGPathLine >> trachelShapeFor: anEdge [
	| trachelShape |
	trachelShape := self trachelShapeClass new.
	trachelShape from: (attachPoint startingPointOf: anEdge) to: (attachPoint endingPointOf: anEdge).
	self updateFor: anEdge trachelShape: trachelShape.
	^ trachelShape
]

{ #category : #rendering }
RTSVGPathLine >> updateFor: edge trachelShape: trachelShape [
	trachelShape resetPath.
	trachelShape strokePaint: (self colorFor: edge).
	trachelShape width: (self widthFor: edge).
	trachelShape svgPath: (self pathFor: edge).
	trachelShape color: Color transparent
	
]