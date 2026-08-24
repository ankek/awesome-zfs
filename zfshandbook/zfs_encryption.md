# Encryption

ZFS offers **native encryption** that allows datasets to be encrypted at rest using cryptographic keys. This feature is built directly into ZFS, eliminating the need for third-party encryption tools and providing a seamless way to secure sensitive data. ZFS encryption is per-dataset, meaning each dataset can have its own encryption settings, making it highly flexible for various security needs.

### Encrypting Datasets

To encrypt a dataset in ZFS, encryption must be specified at the time of dataset creation. The `zfs create` command includes an `-o encryption` option, which defines the encryption algorithm and enables encryption for the dataset.

For example, to create an encrypted dataset using the default AES-256-CCM encryption algorithm, the following command can be used:

```bash
$ sudo zfs create -o encryption=on -o keyformat=passphrase mypool/myencrypteddata
```

This command creates a new encrypted dataset named `mypool/myencrypteddata` and prompts for a passphrase. By default, ZFS uses AES-256 encryption, a secure and widely adopted standard.

**Key Points:**

-   Encryption must be enabled at the time of dataset creation and cannot be retroactively applied to an existing dataset.
-   Encrypted datasets can inherit properties from their parent datasets, including encryption settings.
-   ZFS supports multiple encryption algorithms, including AES-256-CCM and AES-256-GCM, with CCM being the default.

### Managing Encryption Keys

ZFS supports different key formats for managing encryption keys, including **passphrase-based keys** and **raw keys**.

1.  **Passphrase-Based Keys**: A passphrase is provided to unlock the dataset, as shown in the example above. This is a simple option for environments where users can manually unlock datasets using a passphrase. However, passphrases should be complex and stored securely to avoid unauthorized access.

2.  **Raw Keys**: For automated environments or higher security, raw keys can be used instead of passphrases. Raw keys are provided as a hex string and can be stored in key management systems (KMS) for enhanced security. An example of setting up a dataset with a raw key is as follows:

```bash
$ sudo dd if=/dev/random of=/root/mykey bs=32 count=1
$ sudo zfs create -o encryption=on -o keyformat=raw -o keylocation=file:///root/mykey mypool/myencrypteddata
```

This command generates a random key, saves it to a file, and creates a dataset using that raw key for encryption.

### Key Management Commands

-   To **load an encryption key** (unlock a dataset) after system reboot or manually:

```bash
$ sudo zfs load-key mypool/myencrypteddata
```

-   To **unload an encryption key** (lock a dataset):

```bash
$ sudo zfs unload-key mypool/myencrypteddata
```

-   To **change the encryption key** or passphrase for a dataset:

```bash
$ sudo zfs change-key mypool/myencrypteddata
```

This allows for secure rotation of encryption keys, ensuring that datasets remain protected as security policies evolve.

### Best Practices for Secure Storage

When using ZFS encryption, it is essential to follow best practices to maximize security and minimize the risk of unauthorized access:

1.  **Use Strong Passphrases**: When using passphrase-based encryption, ensure that passphrases are long and complex, incorporating letters, numbers, and special characters. Avoid simple or easily guessable passphrases.

2.  **Leverage Raw Keys in Secure Environments**: In automated environments, consider using raw keys instead of passphrases. Raw keys should be stored in secure key management solutions, such as hardware security modules (HSMs) or software-based KMS (Key Management Systems), rather than on local storage.

3.  **Implement Regular Key Rotation**: Encryption keys should be rotated periodically to mitigate the risk of compromised keys. ZFS allows for seamless key changes without disrupting access to data.

4.  **Encrypt All Sensitive Datasets**: It is best to apply encryption to all datasets containing sensitive or confidential data. Since encryption is done at the dataset level, consider encrypting datasets used for personal data, financial information, or any regulated data.

5.  **Monitor Key Access and Use**: Ensure that access to encryption keys is monitored and logged. This can help detect unauthorized attempts to unlock or access encrypted datasets.

6.  **Backup Keys Securely**: Ensure that encryption keys (especially raw keys) are backed up securely. If keys are lost, encrypted data cannot be recovered. Backups should be stored in secure, offline locations with access controls in place.