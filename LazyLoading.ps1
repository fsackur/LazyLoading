function Get-ServerProperty
{
    param
    (
        [string[]]$Property,

        [object]$Server
    )

    # Mock some API call
    foreach ($Prop in $Property)
    {
        Get-Random $Prop.GetHashCode()
    }
}


class Server
{
    Server ()
    {
        foreach ($Prop in [Server]::_properties)
        {
            $this | Add-Member ScriptProperty -Name $Prop -Value {

                if (-not $this._dict.ContainsKey($Prop))
                {
                    $this._dict[$Prop] = Get-ServerProperty $Prop -Server $this
                }

                return $this._dict[$Prop]

            }.GetNewClosure()
        }
    }


    hidden static [string[]] $_properties = @(
        'Foo',
        'Bar',
        'Baz'
    )


    hidden [hashtable] $_dict = @{}

}


$s = [Server]::new()
$s


# Output:

#       Foo       Bar       Baz
#       ---       ---       ---
# 230636006 145716468 285402623