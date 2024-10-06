#Crypto CTF
Name: Bad Padding
Category: Crytpo
Description: RSA encrypted small message using padding (loosest sense of the word)
<details>
<summary>Solution:</summary> m is encrypted as:
	(k(n-m))^3 mod n
       =-(k^3)(m^3) mod n   (since by binomial theorem, only last term in above expansion is not a multiple of n)
       =n-((k^3 mod n)(m^3 mod n) mod n)   (added n to ensure value positive)
       =n-((k^3)(m^3) mod n)   (since k^3,m^3 < n)
       =c   (encrypted message)
	n-c = (k^3)(m^3) mod n. Try solving algebraically for m, e.g. ((n-c)^(1/3))/k, (((n-c)+n)^(1/3))/k, (((n-c)+2n)^(1/3))/k...

(Note: the file in the challenge directory should be shared with the player)

Flag is: Intake24{6879760#}
</details>
