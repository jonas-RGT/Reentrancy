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

Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 2.64ms (954.90µs CPU time)

Ran 1 test for test/CrossFunctionVault.t.sol:CrossFunctionVaultTest
[PASS] testCrossFunctionReentrancyExploit() (gas: 95198)
Traces:
  [115098] CrossFunctionVaultTest::testCrossFunctionReentrancyExploit()        
    ├─ [0] VM::prank(PointEvaluation: [0x000000000000000000000000000000000000000A])
    │   └─ ← [Return]
    ├─ [89854] CrossFunctionAttacker::attack{value: 1000000000000000000}()     
    │   ├─ [22559] CrossFunctionVault::deposit{value: 1000000000000000000}()   
    │   │   └─ ← [Stop]
    │   ├─ [54906] CrossFunctionVault::withdraw(1000000000000000000 [1e18])    
    │   │   ├─ [26972] CrossFunctionAttacker::receive{value: 1000000000000000000}()
    │   │   │   ├─ [23748] CrossFunctionVault::transfer(0x000000000000000000000000000000000000000b, 1000000000000000000 [1e18])
    │   │   │   │   └─ ← [Stop]
    │   │   │   └─ ← [Stop]
    │   │   └─ ← [Stop]
    │   └─ ← [Stop]
    ├─ [779] CrossFunctionVault::balances(0x000000000000000000000000000000000000000b) [staticcall]
    │   └─ ← [Return] 1000000000000000000 [1e18]
    ├─ [779] CrossFunctionVault::balances(CrossFunctionAttacker: [0xf6a171f57ACAc30C292e223eA8aDBb28abD3E14d]) [staticcall]
    │   └─ ← [Return] 115792089237316195423570985008687907853269984665640564039456584007913129639936 [1.157e77]
    └─ ← [Stop]

Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 9.20ms (860.20µs CPU time)

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
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [110534]
 Attacker::receive{value: 1000000000000000000}()
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
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [51188] Attacker::receive{value: 1000000000000000000}()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [50397] VulnerableVault::withdraw()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [42710] Attacker::receive{value: 1000000000000000000}()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [41919] VulnerableVault::withdraw()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [34232] Attacker::receive{value: 1000000000000000000}()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [33441] VulnerableVault::withdraw()
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   ├─ [25754]
 Attacker::receive{value: 1000000000000000000}()
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
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─
 ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]   
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]       
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
    │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   │   └─ ← [Stop]
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

Suite result: ok. 1 passed; 0 failed; 0 skipped; finished in 4.19ms (2.95ms CPU time)

Ran 3 test suites in 2.01s (16.02ms CPU time): 3 tests passed, 0 failed, 0 skipped (3 total tests)