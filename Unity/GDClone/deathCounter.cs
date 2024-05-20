using UnityEngine;
using UnityEngine.UI;

public class DeathCounter : MonoBehaviour
{
    public Text deathCountText;
    public int deathCount = 0;

    private static DeathCounter instance;
    // Start is called before the first frame update
    void Start()
    {
        DontDestroyOnLoad(gameObject);
        UpdateDeathCountText();
    }

    public void IncrementDeathCounter()
    
    {

        deathCount++;
        UpdateDeathCountText();

    }

    private void UpdateDeathCountText()

    {

        deathCountText.text = "Death Counter:" + deathCount.ToString();

    }
}
