Ran 1 test for test/SecureVault.t.sol:SecureVaultTest
[PASS] testReentrancyAttackFails() (gas: 507307)
Traces:
  [507307] SecureVaultTest::testReentrancyAttackFails()
    ├─ [0] VM::deal(SecureVaultTest: [0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496], 1000000000000000000 [1e18])
    │   └─ ← [Return]
    ├─ [373047] → new Attacker@0x2e234DAe75C793f67A35089C9d99245E1C58470b
    │   └─ ← [Return] 1640 bytes of code
    ├─ [0] VM::expectRevert(custom error 0xf4844814)
    │   └─ ← [Return]
    ├─ [62307] Attacker::attack{value: 1000000000000000000}()
    │   ├─ [22559] SecureVault::deposit{value: 1000000000000000000}()
    │   │   └─ ← [Stop]
    │   ├─ [31791] SecureVault::withdraw()
    │   │   ├─ [1410] Attacker::receive{value: 1000000000000000000}()
    │   │   │   ├─ [604] SecureVault::withdraw()
    │   │   │   │   └─ ← [Revert] Reentrancy
    │   │   │   └─ ← [Revert] Reentrancy
    │   │   └─ ← [Revert] Transfer failed
    │   └─ ← [Revert] Transfer failed
    └─ ← [Stop]

Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 3.59ms (942.30µs CPU time)

Ran 1 test for test/VulnerableVault.t.sol:VulnerableVaultTest
[PASS] testReentrancyAttack() (gas: 632867)
Traces:
  [652767] VulnerableVaultTest::testReentrancyAttack()
    ├─ [0] VM::deal(VulnerableVaultTest: [0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496], 1000000000000000000 [1e18])
    │   └─ ← [Return]
    ├─ [373047] → new Attacker@0x2e234DAe75C793f67A35089C9d99245E1C58470b
    │   └─ ← [Return] 1640 bytes of code
    ├─ [208076] Attacker::attack{value: 1000000000000000000}()
    │   ├─ [22559] VulnerableVault::deposit{value: 1000000000000000000}()
    │   │   └─ ← [Stop]
    │   ├─ [177567] VulnerableVault::withdraw()
    │   │   ├─ [169880] Attacker::receive{value: 1000000000000000000}()
    │   │   │   ├─ [169089] VulnerableVault::withdraw()
    │   │   │   │   ├─ [161402] Attacker::receive{value: 1000000000000000000}()
    │   │   │   │   │   ├─ [160611] VulnerableVault::withdraw()
    │   │   │   │   │   │   ├─ [152924] Attacker::receive{value: 1000000000000000000}()
    │   │   │   │   │   │   │   ├─ [152133] VulnerableVault::withdraw()
    │   │   │   │   │   │   │   │   ├─ [144446] Attacker::receive{value: 1000000000000000000}()
    │   │   │   │   │   │   │   │   │   ├─ [143655] VulnerableVault::withdraw()
    │   │   │   │   │   │   │   │   │   │   ├─ [135968] Attacker::receive{value: 1000000000000000000}()
    │   │   │   │   │   │   │   │   │   │   │   ├─ [135177] VulnerableVault::withdraw()
    │   │   │   │   │   │   │   │   │   │   │   │   ├─ [127490] Attacker::receive{value: 1000000000000000000}()
    │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [126699] VulnerableVault::withdraw()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [119012] Attacker::receive{value: 1000000000000000000}()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [118221] VulnerableVault::withdraw()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [110534] Attacker::receive{value: 1000000000000000000}()       
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [109743] VulnerableVault::withdraw()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [102056] Attacker::receive{value: 1000000000000000000}()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [101265] VulnerableVault::withdraw()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [93578] Attacker::receive{value: 1000000000000000000}()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [92787] VulnerableVault::withdraw()        
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [85100] Attacker::receive{value: 1000000000000000000}()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [84309] VulnerableVault::withdraw()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [76622] Attacker::receive{value: 1000000000000000000}()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [75831] VulnerableVault::withdraw()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [68144] Attacker::receive{value: 1000000000000000000}()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [67353] VulnerableVault::withdraw()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [59666] Attacker::receive{value: 1000000000000000000}()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [58875] VulnerableVault::withdraw()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [51188]
 Attacker::receive{value: 1000000000000000000}()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [50397] VulnerableVault::withdraw()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [42710] Attacker::receive{value: 1000000000000000000}()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [41919] VulnerableVault::withdraw()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [34232] Attacker::receive{value: 1000000000000000000}()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [33441] VulnerableVault::withdraw()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [25754] Attacker::receive{value: 1000000000000000000}()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [24963] VulnerableVault::withdraw()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [17276] Attacker::receive{value: 1000000000000000000}()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [16485] VulnerableVault::withdraw()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [8798] Attacker::receive{value: 1000000000000000000}()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [8007] VulnerableVault::withdraw()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [320] Attacker::receive{value: 1000000000000000000}()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─
 ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]   
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]       
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   └─ ← [Stop]
    │   │   │   └─ ← [Stop]
    │   │   └─ ← [Stop]
    │   └─ ← [Stop]
    └─ ← [Stop]

Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 3.95ms (2.76ms CPU time)

Ran 2 test suites in 887.20ms (7.54ms CPU time): 2 tests passed, 0 failed, 0 skipped (2 total tests)