function onEvent(name, value1, value2)
    if name == '5K Reform' then
		setPropertyFromGroup('opponentStrums', 2, 'alpha', 1)
		setPropertyFromGroup('playerStrums', 2, 'alpha', 1)	
	
        setPropertyFromGroup('opponentStrums', 0, 'x', defaultOpponentStrumX0)
        setPropertyFromGroup('opponentStrums', 1, 'x', defaultOpponentStrumX1)
        setPropertyFromGroup('opponentStrums', 2, 'x', defaultOpponentStrumX2)
        setPropertyFromGroup('opponentStrums', 3, 'x', defaultOpponentStrumX2 + 100)
        setPropertyFromGroup('opponentStrums', 4, 'x', defaultOpponentStrumX3 + 100)

        setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0)
        setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1)
        setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2)
        setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3)
        setPropertyFromGroup('playerStrums', 4, 'x', defaultPlayerStrumX4)
		

    end
end