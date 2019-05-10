class Server
{
    Server ()
    {
        foreach ($Prop in [Server]::_properties)
        {
            $this | Add-Member ScriptProperty -Name $Prop -Value {
                $Prop
            }.GetNewClosure()
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
# Foo Bar Baz