param($prefix, $dns)
for ($ip = 1; $ip -le 254; $ip++) {
    $addr = "$prefix.$ip"
    $response = Resolve-DnsName -DnsOnly $addr -Server $dns -ErrorAction Ignore
    if ($response) {
        Write-Host "$addr $($response.NameHost)"
    }
}