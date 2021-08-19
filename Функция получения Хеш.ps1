function Get-HashFiles {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        $Path,
        [Parameter(Mandatory)]
        [ValidateSet('MACTripleDES','MD5','RIPEMD160','SHA1','SHA256','SHA384','SHA512')]
        $Algorithm
    )
    $hash = @{}
    $files = ls $Path -File -Recurse
    $fileHash = $files | ForEach-Object {Get-FileHash $PSItem.FullName -Algorithm $Algorithm}
    foreach ($file in $fileHash) {
        $hash += @{
            $file.Path=$file.Hash
        }
    }
    $hash
}