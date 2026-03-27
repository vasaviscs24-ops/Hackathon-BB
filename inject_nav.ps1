$dir = "c:\bmsce_4th_sem\HackathonBB\Hackathon-BB"
$files = Get-ChildItem -Path $dir -Filter *.html

$newNav = @"
        <ul class="nav-links">
            <li><a href="index.html">Home</a></li>
            <li class="dropdown">
                <a href="about.html">About</a>
                <div class="dropdown-content">
                    <a href="governing-bodies.html">Governing Bodies</a>
                    <a href="administration.html">Administration</a>
                    <a href="e-governance.html">E-Governance</a>
                    <a href="partner-institutions.html">Group of Institutions</a>
                    <a href="life-at-bmsce.html">Life at BMSCE</a>
                </div>
            </li>
            <li class="dropdown">
                <a href="research-about.html">Research</a>
                <div class="dropdown-content">
                    <a href="research-about.html">About R&D</a>
                    <a href="research-labs.html">Innovative Labs</a>
                    <a href="research-nano.html">Nanomaterials Centre</a>
                    <a href="research-patents.html">Patents Filed</a>
                </div>
            </li>
            <li class="dropdown">
                <a href="facilities.html">Facilities</a>
                <div class="dropdown-content">
                    <a href="facilities.html#library">Library</a>
                    <a href="facilities.html#hostel">Hostels</a>
                    <a href="facilities.html#sports">Sports Complex</a>
                    <a href="facilities.html#data-center">Data Center</a>
                    <a href="facilities.html#hospital">BMS Hospital</a>
                    <a href="facilities.html#counselling">Counselling Center</a>
                </div>
            </li>
            <li><a href="admissions.html">Admissions</a></li>
        </ul>
"@

foreach ($file in $files) {
    if ($file.Name -ne "facilities.html") { # We already wrote this one fully properly
        $content = [System.IO.File]::ReadAllText($file.FullName)
        $content = $content -replace '(?s)<ul class="nav-links">.*?</ul>', $newNav
        [System.IO.File]::WriteAllText($file.FullName, $content, [System.Text.Encoding]::UTF8)
    }
}
Write-Output "Mass Navbar Injection Completed Successfully."
