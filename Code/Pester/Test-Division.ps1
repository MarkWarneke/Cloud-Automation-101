# A function for dividing two numbers, returns the result of the operation.**

function division {

    param (

        [int]$a,

        [int]$b

    )

    return $a / $b

}



# Add and say unit tests for the method division below…

Describe 'division test' -Tags 'BasicTests' {

    It 'divides positive numbers' {

        division 6 3 | Should Be 2



    }



    It 'divides negative numbers' {

        division -6 -3 | Should Be 2

    }



    It 'throws error for divide by zero' {

        {division 6 0} | Should Throw

    }

}