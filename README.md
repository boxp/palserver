# boxp / palserver

うちの palserver の manifest とかをおいてるやつです

## Troubleshooting

### マウントした Saved フォルダの書き込み権限がなく落ちる(Linux)

Saved フォルダに nonroot ユーザーで所有権を与えると解消します

```
sudo chown -R 65532:100 Saved/
```