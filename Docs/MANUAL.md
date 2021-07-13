# Gordian Seed Tool Manual

**Gordian Seed Tool** is an iOS-based seed manager that is a reference app for the Gordian system. It allows you to safely and securely store your keys and to export public keys, private keys, and seeds as required.

Why use **Seed Tool**? Because storing your seeds on a fully networked device is a major security vulnerability, and it also leaves your seeds vulnerable to loss. Seed Tool resolves both of these problems. You can move selected public and private keys online only as they're required, and you can be sure that your seeds are in a secure vault that's backed up, and not dependent on a single device.

**Usability Features:**

* Import via QR or a variety or text specifications.
* Export via QR or Clipboard or printing.
* Identify Seeds using [Object Identity Block](https://github.com/BlockchainCommons/Research/blob/master/papers/bcr-2021-002-digest.md#object-identity-block).
 
**Security Features:**

* Stored Securely with Apple Encryption.
* Protected via 2FA: you must login in to your Apple account, then you must verify with biometrics whenever you access private data.
* Automated iCloud backup and recovery.

**Gordian Seed Tool** is a reference app, demonstrating the [Gordian Principles](https://github.com/BlockchainCommons/GordianSeedTool-iOS#gordian-principles) of independence, privacy, resilience, and openness.

## Installing Seed Tool

You can either purchase **Gordian Seed Tool** from the Apple store or you can compile from the source here.

For full functionality of the iCloud backup, be sure to turn on the following functionality under "Settings > Apple ID > iCloud" on all devices running **Gordian Seed Tool**:

* Keychain
* iCloud Drive

Be _very_ sure that all devices running **Gordian Seed Tool** are fully logged into your Apple account, with full access to iCloud, and switches set as noted above. Failure to do so will result in seed entries not being synced to the iCloud (and other devices).

## Using Seed Tool

**Gordian Seed Tool** is a storage mechanism for seeds, particularly those used in cryptography systems. Seeds used in it will usually follow a three-part cycle.

1. **Add a Seed.** First, you must add seeds to the system. There are two ways to do see.
   * **Import a Seed.** You can import a seed that you generated in a cryptowallet.
   * **Create a Seed.** You can also create a seed directly in Seed Tool.
2. **Store a Seed.** Your seed will be encrypted and also backed up if you have iCloud enabled.
   * **View a Seed.** While you are storing a seed, you will be able to view it and change its metadata.
   * **Shard a Seed.** You can also improve the resilience of your seed by sharding it with SSKR and giving out those shards.
3. **Use a Seed.** You can actively use a seed that is stored in Gordian Seed Tool, without ever having to export it. 
   * **Answer Requests.** Seed Tool uses the [`crypto-request`/`crypto-response`] system defined by Blockchain Commons for URs. This allows Seed Tool to export precisely what's needed by another app.
   * **Derive Keys.** Alternatively, you can choose to export specific derived keys on your own, while maintaining the seed in the app.

**Gordian Seed Tool** is designed so that once you've imported a seed you don't need to ever export it. But, if you want to, you can:

4. **Export a Seed.** You can export seeds using a variety of interoperable specifications.
5. **Delete a Seed.** You can also just delete a seed.

### Viewing the Main Menu

The main menu contains three buttons in the menu bar along the top:

* **Information** (circled "i"). Read documentation on all of the specifications and data types found in **Seed Tool**.
* **Scan** (qr code). Scan a seed (see "Importing a Seed") or a `crypto-request` (see "Using a Seed") from a QR code or import from the Clipboard.
* **Setting** (gear). Choose MainNet or TestNet as your default network (this is used for key derivation, as discussed in "Deriving a Key"); choose whether to sync to iCloud or not. If you wanted to erase all of your data, this would be the place to do so.

> :warning: **WARNING:** We highly suggest you leave iCloud backups on. Without it, if you lose your phone, you will lose all of your seeds. The iCloud backups are encrypted, so no one but you should be able to acces them.

> :warning: **WARNING:** If you choose to delete all your data in Settings, then your seeds will really, genuinely be gone.

Under the main menu are options to **add** ("+") and **delete** ("edit") seeds followed by a list of each of your seeds, with each seed identified by an Object identity Block ("OID"). You can click the right arrow on a seed to see more data about it and to export it.

## Adding a Seed

Seeds can be created or imported. Seed Creation is done through the **add** ("+") button, while seed importing is done via either the qr button (which imports via camera or other automated means) or the **add** button (which does so via pasting).

### Scanning a Seed via Automated Means

The **Scan** (qr code) button on the main menu provides the most automated methods for importing seeds, using your camera, the cut-and-paste clipboard, the file system, or your photo roll. 

To scan a QR code, you can either point your camera at the QR of a seed, import a QR of a seed from your Photos, or choose an image of a QR from your Files. To read the text for a QR, just copy it into your Clipboard and click Paste. Note that for these methodologies, **Seed Tool** expects the QR code or the clipboard to contain a [Uniform Resource](https://github.com/BlockchainCommons/Research/blob/master/papers/bcr-2020-005-ur.md), a standardized way to encode data in an efficient and self-identifying way. This will usually mean a [`ur-crypto-seed`](https://github.com/BlockchainCommons/Research/blob/master/papers/bcr-2020-006-urtypes.md#cryptographic-seed-crypto-seed).

Besides scanning seeds, you can also scan SSKR shares (See "Importing SSKR Shares") or respond to a `crypto-reqest` (see "Answering Requests"), as described below.

### Importing a Seed via Cut and Paste

The **add** ("+") button below the main menu gives a number of options for creating seeds in **Seed Tool**, but also lets you input text as hex bytes, `ur:crypto-seed`, `Bytewords`, or BIP39 Mnemonic Words. In each case, you just type or paste the words, and then click "Done".

The following show examples of the data you might input for each data type:

* **Hex Bytes:** 59F2293A5BCE7D4DE59E71B4207AC5D2
* **`ur:crypto-seed`:** `ur:crypto-seed/oyadgdhkwzdtfthptokigtvwnnjsqzcxknsktdhpyljeda`
* **Byte Words:** hawk whiz diet fact help taco kiwi gift view noon jugs quiz crux kiln silk tied omit keno lung jade
* **BIP 39 Mnemonic Words:** fly mule excess resource treat plunge nose soda reflect adult ramp planet

Again, you can also add add SSKR shares, as described below.

#### Importing SSKR Shares

SSKR stands for Sharded Secret Key Reconstruction, a Blockchain Commons [specification](https://github.com/BlockchainCommons/Research/blob/master/papers/bcr-2020-011-sskr.md). It allows you to shard a secret (such as a seed) into a number of shares, and then reconstruct the secret from some number (threshold) of those seeds that's typically fewer than all of them. For example, you might shard a seed into three shares with a threshold of two. Typically, the shares are given out to friends and family, placed in distant safety deposit boxes, or otherwise separated. A threshold of the shares can then be collected and used to reconstruct the seed if the original is lost. 

One of the notable features in **Gordian Seed Tool** is that it can be used to collect together shares and reconstruct your seed. There are currently three ways to do so:

* **Scan: QRs.** Photograph QRs of SSKR shares until you have a threshold.
* **Scan: Paste Crypto-SSKR.** Paste `ur:crypto-sskr` of SSKR shares until you have a threshold.
* **Add: Shares.** Simultaneouly paste sufficient shares to meet threshold into the box.

The **Scan** functionality is currently the more advanced of the two options, and so is the suggested methodology. It will allow you to photograph or paste individual shares, and will alert you to how many more are needed to meet the threshold and reconstruct the seed.

The `ur:crypto-sskr` specification, which can be used in the `Add` section, in the `Scan: Paste`, or encoded as a QR, look like this:

* ur:crypto-sskr/gobnbdaeadaevdbkclhseeehtldedikgpysoenreceeeeorofrwn
* ur:crypto-sskr/gobnbdaeadadrkhesefhjzdycypduokkjejponsayabguymwwnwz

The SSKR words, which can only be used in the `Add` section, looks like this:

* tuna acid epic gyro gray tent able acid able frog cusp heat poem owls undo holy rich monk zaps cost brag loud fair dice idle skew iris beta tied
* tuna acid epic gyro gray tent able acid acid diet fact gala numb leaf fish toys kite cyan inky help keep heat inky song trip bulb flap yoga jazz

### Creating a Seed

**Gordian Seed Tool** can also be used to create new seeds. This is doing using the **add** (+) button on the main menu. There are four ways to do so:

* **Quick Create.** Depend on your mobile device's randomization to create a seed.
* **Coin Flips.** Flip coins and enter results.
* **Die Rolls.** Roll six-sided dice and enter results.
* **Playing Cards.** Draw cards and enter results. (Be sure to replace cards as you draw, for the entropy calculation to be correct.)

The easiest of these methods is certainly the "Quick Create", but in that case you are depending on the randomization of your phone, and if there is ever an exploit revealed, you'll be forced to sweep all of your funds. Using coin flips, die rolls, or playing cards is perhaps more likely to create good entropy, and is less likely to have an exploit revealed, but you _must_ properly flip every coin, roll every die, or draw every card, no matter how tedious it is, and you must wait until you have at least 128 bits of entropy, which is considered "Very Strong". If you are not willing to do this, you should just "Quick Create" instead. Once you have a "Very Strong" amount of entropy, you should click the "Done" button, and then you'll be given the opportunity to "Save" your new seed.

The coin flipping, die rolling, and card drawing methods all have three buttons at the bottom, which allow you to: erase one entry; use the randomizer to add one entry; or use the randomizer to add all of the entries.

The usage of entropy in **Gordian Seed Tool** matches that of [**LetheKit**](https://github.com/BlockchainCommons/lethekit), so you can check the results for one to the other if you want to be sure of a new seed that you've created.

---

### Reading the OIB

Each Seed is displayed with an [Object Identity Block (OIB)](https://github.com/BlockchainCommons/Research/blob/master/papers/bcr-2021-002-digest.md#object-identity-block), which can be seen on both the listing and view pages, helps you to visually identify a seed.

It contains the following elements:

* **Lifehash.** This is a [methodology](https://github.com/BlockchainCommons/LifeHash) for creating an evocative visual representation of data based on Conway's Game of Life. It makes it easy to recognize a seed at a glance.
* **Type.** An icon represents the type of data. On the listings and main views, this is a seed icon.
* **Name.** A human-readable name for the seed. **Seed Tool** chooses an evocative bit of nonsense derived from the content of the seed itself as the default.
* **Digest.** An abbreviated six-character digest of the seed.

The lifehash, the type, the digest, and all but the last two words in the default name should be identical anywhere that you import your seed that uses the Blockchain Commons OIB specification. That will help you to always know that your seed was accurately transmitted, and to always make sure you're working with the right seed.

OIBs are also displayed for various keys derived from your seed. They use different icons for the "type" and do not include a name.

### Deleting a Seed

Seeds can be deleted with the "Edit" function on the seed listing page. You can immediately "Undo" it if you deleted the wrong seed, but afterward, any seed you deleted will be gone forever. Be careful!

### Viewing a Seed

You can view additional details of a seed by clicking the seed in the seed listing menu.  The resulting page will show you the OIB, the bit size, the resultant strength, and the creation date. You can also edit the "Name" and add "Notes".

This is additionally where you export information on the seed: either the public key or the private data.

### Exporting a Seed

A seed can be exported by touching the "Decrypt" box under the "Data" section of a seed. This will require your 2FA, such as a thumbprint or a Face ID. After it decrypts, you can then click the "Share" button to the top right. This will allow you to export as hex, as BIP39 Mnemonic Words, as ByteWords, or as a `ur:crypto-seed`, and has additional functions for exporting SSKR shares and deriving and exporting keys.

These functions all will copy the data in the appropriate form to your clipboard, allowing you to then paste it until the app of your choice. The `ur:crypto-seed` alternatively allows you to print the QR containing the `ur:crypto-seed` for your seed.

> :warning: **WARNING:** Generally, you want to always keep your seed in **Seed Tool**. It is both secure and resilient in the app. There is no reason to export it. Instead, export keys as appropriate, ideally watch-only public keys or specific keys in response to a `ur:crypto-request` from another app.

#### Exporting SSKR Shares

### Deriving a Key

[use other app, if possible]

### Answering a Request

### Transforming a Seed