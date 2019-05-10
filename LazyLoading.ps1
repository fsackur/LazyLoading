class Server
{
    Server ()
    {
        foreach ($Prop in [Server]::_properties)
        {
            $this | Add-Member ScriptProperty -Name $Prop -Value {
                2 + 2
            }
        }
    }


    hidden static [string[]] $_properties = @(
        'Foo',
        'Bar',
        'Baz'
    )

}


$s = [Server]::new()
$s


# Output:

# Foo Bar Baz
# --- --- ---
#   4   4   4