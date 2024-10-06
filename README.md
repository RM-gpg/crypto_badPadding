# Crypto CTF
Name: Bad Padding <br />
Category: Crytpo <br />
Description: RSA encrypted small message using padding (loosest sense of the word) <br />
<details>
<summary>Solution:</summary> m is encrypted as: <br />
	(k(n-m))^3 mod n <br />
       =-(k^3)(m^3) mod n   (since by binomial theorem, only last term in above expansion is not a multiple of n) <br />
       =n-((k^3 mod n)(m^3 mod n) mod n)   (added n to ensure value positive) <br />
       =n-((k^3)(m^3) mod n)   (since k^3,m^3 < n) <br />
       =c   (encrypted message) <br />
	n-c = (k^3)(m^3) mod n. Try solving algebraically for m, e.g. ((n-c)^(1/3))/k, (((n-c)+n)^(1/3))/k, (((n-c)+2n)^(1/3))/k... <br />


Flag is: Intake24{6879760#}
</details>
